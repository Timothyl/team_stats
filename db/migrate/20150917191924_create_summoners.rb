class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.integer :riot_id, null: false
      t.string :name, null: false

      t.timestamps null: false
      t.index :riot_id, unique: true
      t.index :name, unique: true
    end
  end
end
