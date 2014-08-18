# This migration comes from mini_bi_engine (originally 20140730140138)
class CreateUniverses < ActiveRecord::Migration
  def change
    create_table :universes do |t|
      t.string :name
      t.string :desc
      t.text :sql

      t.timestamps
    end
  end
end
