class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :name
      t.string :description
      t.string :private
      t.string :layout

      t.timestamps
    end
  end
end
