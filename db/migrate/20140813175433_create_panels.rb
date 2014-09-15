class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :name, :default => 'New panel'
      t.string :description
      t.string :private, default => true
      t.string :layout, :default => '100' #100%

      t.timestamps
    end
  end
end
