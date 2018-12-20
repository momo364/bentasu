class CreateBoxDishes < ActiveRecord::Migration
  def change
    create_table :box_dishes do |t|
      t.references :box, null: false
      t.references :dish, null: false
      t.timestamps null: false
    end
  end
end
