# This migration comes from mini_bi_engine (originally 20140730161721)
class CreateColumns < ActiveRecord::Migration
  def up
    create_table :columns do |t|
      t.integer :universe_id, :null=> false
      t.string :name, :null=> false
      t.string :label, :null=> false, :length => 50
      t.string :tpo_dado, :length => 1
      t.string :aggregate, :length => 1, :default => 'D' # Dimensao
      t.boolean :filterable # :length => 1, :default => 'S' #Sim
      t.boolean :mandatory, :length => 1
      t.text :sql_values
      t.string :txt_apresentacao

      t.timestamps
    end
    
  end
  def down
    drop_table :columns 
  end
end
