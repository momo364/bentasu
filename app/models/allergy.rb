class Allergy < ActiveRecord::Base
  has_many :allergy_dishes, dependent: :destroy
  has_many :dishes, through: :allergy_dishes
end
