class AddItemDescriptiontoFoodItems < ActiveRecord::Migration[6.0]
  def change
    add_column :food_items, :description, :text
  end
end
