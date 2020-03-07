class FridgesController < ApplicationController
  def index
    @fridges = Fridge.all.order({ :created_at => :desc })

    render({ :template => "fridges/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @fridge = Fridge.where({:id => the_id }).at(0)

    render({ :template => "fridges/show.html.erb" })
  end

  def create
    @fridge = Fridge.new
    @fridge.name = params.fetch("query_name")

    if @fridge.valid?
      @fridge.save
      redirect_to("/fridges", { :notice => "Fridge created successfully." })
    else
      redirect_to("/fridges", { :notice => "Fridge failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @fridge = Fridge.where({ :id => the_id }).at(0)

    @fridge.name = params.fetch("query_name")

    if @fridge.valid?
      @fridge.save
      redirect_to("/fridges/#{@fridge.id}", { :notice => "Fridge updated successfully."} )
    else
      redirect_to("/fridges/#{@fridge.id}", { :alert => "Fridge failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @fridge = Fridge.where({ :id => the_id }).at(0)

    @fridge.destroy

    redirect_to("/fridges", { :notice => "Fridge deleted successfully."} )
  end
end
