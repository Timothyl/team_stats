class ChangeToDecimal < ActiveRecord::Migration
  def up
    change_column :rosters, :total_percent_damage_dealt, :decimal, precision: 4, scale: 1
    change_column :rosters, :total_percent_magic_damage, :decimal, precision: 4, scale: 1
    change_column :rosters, :total_percent_physical_damage, :decimal, precision: 4, scale: 1
    change_column :rosters, :total_percent_true_damage, :decimal, precision: 4, scale: 1
    change_column :rosters, :avg_phys_damage, :decimal, precision: 4, scale: 1
    change_column :rosters, :avg_magic_damage, :decimal, precision: 4, scale: 1
    change_column :rosters, :avg_true_damage, :decimal, precision: 4, scale: 1
    change_column :rosters, :avg_percent_damage, :decimal, precision: 4, scale: 1
  end

  def down
    change_column :rosters, :total_percent_damage_dealt, :integer
    change_column :rosters, :total_percent_magic_damage, :integer
    change_column :rosters, :total_percent_physical_damage, :integer
    change_column :rosters, :total_percent_true_damage, :integer
    change_column :rosters, :avg_phys_damage, :integer
    change_column :rosters, :avg_magic_damage, :integer
    change_column :rosters, :avg_true_damage, :integer
    change_column :rosters, :avg_percent_damage, :integer
  end
end
