# This migration comes from mini_bi_engine (originally 20140730161721)
class CreateColumns < ActiveRecord::Migration
  def change
    create_table :columns do |t|
      t.integer :universe_id, :null=> false
      t.string :nme_termo, :null=> false
      t.string :dsc_termo, :null=> false, :length => 50
      t.string :tpo_dado, :length => 1
      t.string :tpo_objeto, :length => 1
      t.string :sta_coluna_filtro, :length => 1
      t.string :sta_obrigado, :length => 1
      t.text :dsc_sql_valores
      t.string :txt_apresentacao

      t.timestamps
    end
    
  end
  def down
    drop_table :columns 
  end
end
