class AddJoinDate < ActiveRecord::Migration
  def change
    add_column :rosters, :joindate, :datetime
  end
end
