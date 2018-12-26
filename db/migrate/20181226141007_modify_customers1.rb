class ModifyCustomers1 < ActiveRecord::Migration
  def change
    add_column :customers, :hashed_password, :string
  end
end
