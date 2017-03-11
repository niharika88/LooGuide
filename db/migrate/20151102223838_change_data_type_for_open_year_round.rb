class ChangeDataTypeForOpenYearRound < ActiveRecord::Migration
  def change
    change_table :public_parks do |t|
      t.change :open_year_round, :string
      t.change :handicap_accessible, :string
    end
  end
end
