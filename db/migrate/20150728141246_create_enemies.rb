class CreateEnemies < ActiveRecord::Migration
  def change
    create_table :enemies do |t|
      t.string :name
      t.integer :hp
      t.integer :fire
      t.integer :torpedo
      t.integer :defence
      t.string :equipment_type

      t.timestamps
    end
  end
end
