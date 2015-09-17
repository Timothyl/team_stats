class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      t.belongs_to :summoner, null: false
      t.belongs_to :team, null: false
    end
  end
end
