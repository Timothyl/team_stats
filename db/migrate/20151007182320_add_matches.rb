class AddMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.belongs_to :team, null: false
      t.integer :match_id, null: false
      t.json :info
    end
  end
end
