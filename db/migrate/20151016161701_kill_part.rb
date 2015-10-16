class KillPart < ActiveRecord::Migration
  def change
    add_column :rosters, :kill_part, :decimal, precision: 4, scale: 1
  end
end
