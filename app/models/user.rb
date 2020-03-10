# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  phone_number    :string
#  sendtime        :time
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  validates :username, :presence => true
  validates :username, :uniqueness => true  
  
  has_secure_password

  has_many :sent_follow_requests, :class_name => "FollowRequest", :foreign_key => "sender_id", :dependent => :destroy
  has_many :food_items, :foreign_key => "owner_id", :dependent => :destroy
end
