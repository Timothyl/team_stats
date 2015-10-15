class Vision < ActiveRecord::Migration
  def change
    add_column :rosters, :wards_placed, :decimal, precision: 4, scale: 1
    add_column :rosters, :wards_destroyed, :decimal, precision: 4, scale: 1
  end
end
