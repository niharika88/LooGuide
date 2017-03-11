class AddLatLongToPublicParks < ActiveRecord::Migration
  def change
    add_column :public_parks, :latitude, :float
    add_column :public_parks, :longitude, :float
  end
end
