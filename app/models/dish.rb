class Dish < ActiveRecord::Base
  has_many :allergy_dishes, dependent: :destroy
  has_many :allergies, through: :allergy_dishes
end
