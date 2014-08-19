# This migration comes from mini_bi_engine (originally 20140819122536)
class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer :panel_id
      t.integer :universe_id
      t.string :title
      t.string :subtitle
      t.string :pattern

      t.timestamps
    end
  end
end
