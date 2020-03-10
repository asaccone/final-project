class AddTimeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sendtime, :time
  end
end
