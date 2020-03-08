class FoodItemsController < ApplicationController
  def index
    @food_items = FoodItem.all.order({ :created_at => :desc })

    render({ :template => "food_items/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @food_item = FoodItem.where({:id => the_id }).at(0)

    render({ :template => "food_items/show.html.erb" })
  end

  def create
    @food_item = FoodItem.new
    @food_item.owner_id = params.fetch("query_owner_id")
    @food_item.item_name = params.fetch("query_item_name")
    @food_item.food_type = params.fetch("query_food_type")
    @food_item.description = params.fetch("query_description")
    @food_item.expiration_date = params.fetch("query_expiration_date")

    if @food_item.valid?
      @food_item.save
      redirect_to("/", { :notice => "Food item created successfully." })
    else
      redirect_to("/", { :alert => "Food item failed to create successfully. #{@food_item.errors.full_messages.to_sentence}." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @food_item = FoodItem.where({ :id => the_id }).at(0)

    @food_item.food_type = params.fetch("query_food_type")
    @food_item.expiration_date = params.fetch("query_expiration_date")
    @food_item.description = params.fetch("query_description")
    @food_item.message1_sent = params.fetch("query_message1_sent", false)
    @food_item.message2_sent = params.fetch("query_message2_sent", false)
    @food_item.message3_sent = params.fetch("query_message3_sent", false)

    if @food_item.valid?
      @food_item.save
      redirect_to("/food_items/#{@food_item.id}", { :notice => "Food item updated successfully."} )
    else
      redirect_to("/food_items/#{@food_item.id}", { :alert => "Food item failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @food_item = FoodItem.where({ :id => the_id }).at(0)

    @food_item.destroy

    redirect_to("/food_items", { :notice => "Food item deleted successfully."} )
  end
end
