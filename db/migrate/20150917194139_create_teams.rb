class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :full_Id, null: false
      t.string :name, null: false
      t.string :tag, null: false

      t.timestamps null: false
      t.index :full_Id, unique: true
      t.index :name, unique: true
    end
  end
end
