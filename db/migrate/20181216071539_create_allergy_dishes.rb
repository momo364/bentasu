class CreateAllergyDishes < ActiveRecord::Migration
  def change
    create_table :allergy_dishes do |t|
      t.references :allergy, null: false
      t.references :dish, null: false
      t.timestamps null: false
    end

    add_index :allergy_dishes, :allergy_id
    add_index :allergy_dishes, :dish_id
  end
end
