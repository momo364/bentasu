class CreateSaleManagements < ActiveRecord::Migration
  def change
    create_table :sale_managements do |t|
      t.references :dish, null: false
      t.integer :planned_number,null: false, default: 0
      t.integer :made_number, null: false, default: 0
      t.integer :sold_number, null:false, default:0
      t.timestamps null: false
    end
  end
end
