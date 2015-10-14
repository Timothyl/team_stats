class GoldShare < ActiveRecord::Migration
  def change
    add_column :rosters, :total_gold, :integer
    add_column :rosters, :avg_gold, :integer
  end
end
