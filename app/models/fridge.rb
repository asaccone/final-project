# == Schema Information
#
# Table name: fridges
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fridge < ApplicationRecord
  has_many :comments, :class_name => "FoodItem", :dependent => :destroy
  has_many :follow_requests, :foreign_key => "recipient_id", :dependent => :destroy 
end
