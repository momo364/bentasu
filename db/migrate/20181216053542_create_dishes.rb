class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name, null: false #おかずの名前
      t.integer :price, null: false #値段
      t.integer :calorie, null: false #カロリー
      t.integer :category, null: false #カテゴリー
      t.boolean :potential,null: false, default: true #生産可能フラグ
      t.timestamps null: false
    end
  end
end
