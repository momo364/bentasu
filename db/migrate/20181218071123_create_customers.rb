class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :telephone, null: false
      t.string :mail_address, null: false
      t.string :username, null: false
      t.timestamps null: false
    end
  end
end
