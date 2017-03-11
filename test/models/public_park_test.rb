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

require 'test_helper'

class PublicParkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
