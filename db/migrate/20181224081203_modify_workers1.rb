class ModifyWorkers1 < ActiveRecord::Migration
  def change
    add_column :workers, :hashed_password, :string
  end
end
