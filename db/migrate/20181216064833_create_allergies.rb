class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
