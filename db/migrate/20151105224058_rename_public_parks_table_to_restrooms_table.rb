class RenamePublicParksTableToRestroomsTable < ActiveRecord::Migration
  def change

  	rename_table :public_parks, :restrooms

  end
end
