# == Schema Information
#
# Table name: food_items
#
#  id              :integer          not null, primary key
#  description     :text
#  expiration_date :date
#  food_type       :string
#  item_name       :string
#  message1_sent   :boolean          default(FALSE)
#  message2_sent   :boolean          default(FALSE)
#  message3_sent   :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  fridge_id       :integer
#  owner_id        :integer
#

class FoodItem < ApplicationRecord
  validates :expiration_date, :presence => true
  validates :item_name, :presence => true
  
  belongs_to :owner, :class_name => "User"
  belongs_to :photo, :class_name => "Fridge", :foreign_key => "fridge_id"   
end
