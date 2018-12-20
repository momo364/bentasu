class CreateDishImages < ActiveRecord::Migration
  def change
    create_table :dish_images do |t|
      t.references :dish, null: false
      t.binary :data, null: false
      t.string :content_type,null: false
      t.timestamps null: false
    end
  end
end
