class AddDamageColumns < ActiveRecord::Migration
  def change
    add_column :rosters, :total_percent_damage_dealt, :integer
    add_column :rosters, :total_number_of_games, :integer
    add_column :rosters, :avg_percent_damage, :integer
  end
end
