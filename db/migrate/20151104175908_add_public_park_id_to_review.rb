class AddPublicParkIdToReview < ActiveRecord::Migration
  def change
    remove_column :reviews, :park_id, :integer
    add_column :reviews, :public_park_id, :integer
  end
end
