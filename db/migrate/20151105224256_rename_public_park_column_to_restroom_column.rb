class RenamePublicParkColumnToRestroomColumn < ActiveRecord::Migration
  def change
  	rename_column :reviews, :public_park_id, :restroom_id
  end
end
