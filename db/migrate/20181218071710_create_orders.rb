class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :customer,null: false
      t.boolean :status, null: false, default: false
      t.datetime :time, null: false
      t.timestamps null: false
    end
  end
end
