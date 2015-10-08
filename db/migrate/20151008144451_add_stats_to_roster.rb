class AddStatsToRoster < ActiveRecord::Migration
  def change
    add_column :rosters, :kills, :integer
    add_column :rosters, :deaths, :integer
    add_column :rosters, :assists, :integer
  end
end
