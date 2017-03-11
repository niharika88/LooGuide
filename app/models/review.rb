# == Schema Information
#
# Table name: reviews
#
#  id             :integer          not null, primary key
#  rating         :integer
#  user_id        :integer
#  comment        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  public_park_id :integer
#

class Review < ActiveRecord::Base
  belongs_to :restroom
  belongs_to :user

  validates :comment, length: {maximum: 140}

  

  # validations
  # validate rating up 10
  # validate comment characters up to 140



  # instance methods





end
