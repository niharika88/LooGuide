class CreatePublicParks < ActiveRecord::Migration
  def change
    create_table :public_parks do |t|
      t.string :name
      t.string :location
      t.boolean :open_year_round
      t.boolean :handicap_accessible
      t.string :borough 
      t.timestamps null: false
    end
  end
end
