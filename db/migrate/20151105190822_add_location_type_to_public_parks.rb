class AddLocationTypeToPublicParks < ActiveRecord::Migration
  def change
    add_column :public_parks, :location_type, :string
  end
end
