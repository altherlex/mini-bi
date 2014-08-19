class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer :panel_id
      t.integer :universe_id
      t.string :title, :default => 'New widget'
      t.string :subtitle
      t.string :pattern

      t.timestamps
    end
  end
end
