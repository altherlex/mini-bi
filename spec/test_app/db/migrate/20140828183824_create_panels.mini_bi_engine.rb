# This migration comes from mini_bi_engine (originally 20140813175433)
class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :name, :default => 'New panel'
      t.string :description
      t.string :private
      t.string :layout

      t.timestamps
    end
  end
end
