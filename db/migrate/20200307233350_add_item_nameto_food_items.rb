class AddItemNametoFoodItems < ActiveRecord::Migration[6.0]
  def change
    add_column :food_items, :item_name, :string
  end
end
