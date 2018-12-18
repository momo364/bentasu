class CreateBoxKinds < ActiveRecord::Migration
  def change
    create_table :box_kinds do |t|
      t.string :name,null: false
      t.integer :capacity, null: false
      t.timestamps null: false
    end
  end
end
