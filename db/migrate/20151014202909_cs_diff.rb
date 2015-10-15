class CsDiff < ActiveRecord::Migration
  def change
    add_column :rosters, :total_cs_diff, :integer
    add_column :rosters, :avg_cs_diff, :integer
  end
end
