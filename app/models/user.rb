# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  has_many :reviews
 
  
  has_secure_password

  validates_uniqueness_of :email 
  validates_presence_of :name, :email 

  
end
