class Cs < ActiveRecord::Migration
  def change
    add_column :rosters, :total_cs, :integer
    add_column :rosters, :total_jungle_cs, :integer
    add_column :rosters, :avg_cs, :integer
    add_column :rosters, :avg_jungle_cs, :integer
  end
end
