class CreateFoodItems < ActiveRecord::Migration[6.0]
  def change
    create_table :food_items do |t|
      t.integer :fridge_id
      t.integer :owner_id
      t.string :food_type
      t.date :expiration_date
      t.boolean :message1_sent, { :default => false }
      t.boolean :message2_sent, { :default => false }
      t.boolean :message3_sent, { :default => false }

      t.timestamps
    end
  end
end
