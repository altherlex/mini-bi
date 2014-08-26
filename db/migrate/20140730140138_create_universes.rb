class CreateUniverses < ActiveRecord::Migration
  def up
    create_table :universes do |t|
      t.string :name
      t.string :description
      t.text :sql

      t.timestamps
    end
  end
  def down
    drop_table :universes
  end
end
