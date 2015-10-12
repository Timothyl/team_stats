class DamageBreakdown < ActiveRecord::Migration
  def change
    add_column :rosters, :total_percent_magic_damage, :integer
    add_column :rosters, :total_percent_physical_damage, :integer
    add_column :rosters, :total_percent_true_damage, :integer
    add_column :rosters, :avg_phys_damage, :integer
    add_column :rosters, :avg_magic_damage, :integer
    add_column :rosters, :avg_true_damage, :integer
  end
end
