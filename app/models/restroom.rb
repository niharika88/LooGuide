# == Schema Information
#
# Table name: public_parks
#
#  id                  :integer          not null, primary key
#  name                :string
#  location            :string
#  open_year_round     :string
#  handicap_accessible :string
#  borough             :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  latitude            :float
#  longitude           :float
#  location_type       :string
#

class Restroom < ActiveRecord::Base
  attr_accessor :reviews_attributes
  has_many :reviews
  accepts_nested_attributes_for :reviews

  def average_rating
    if !(self.reviews.empty?)
      avg = self.reviews.average(:rating).to_f
      avg = avg.round(1)
      "#{avg}/10"
    else
      "Be the first to rate this restroom!"
    end
  end

  def reviews_attributes=(attributes)
    # attributes = {"0" => {user_id: "2", rating: "4", comment: "something"}}
    review = self.reviews.build
    values_hash = attributes.values.first
    rating = values_hash[:rating]
    review.rating = rating.to_f
    review.comment = values_hash[:comment]
    id = values_hash[:user_id]
    review.user_id = id.to_f
  end

end


