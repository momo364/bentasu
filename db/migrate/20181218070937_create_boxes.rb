class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.references :box_kind, null:false
      t.references :order
      t.integer :rice, null: false
      t.integer :number, null: false
      t.timestamps null: false
    end
    add_index :boxes, :box_kind_id
    add_index :boxes, :order_id
  end
end
