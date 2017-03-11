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

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
