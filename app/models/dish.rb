class Dish < ActiveRecord::Base
  has_many :allergy_dishes, dependent: :destroy
  has_many :allergies, through: :allergy_dishes
  has_one :dish_image, dependent: :destroy
  has_one :sale_management, dependent: :destroy
end
