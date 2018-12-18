class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name, null: false
      t.boolean :admin, null: false, default: false
      t.string :username, null: false
      t.string :password, null: false
      t.timestamps null: false
    end
  end
end
