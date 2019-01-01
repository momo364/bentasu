class Box < ActiveRecord::Base
  belongs_to :order , required: false 
  belongs_to :box_kind
  has_many :box_dishes,dependent: :destroy
  has_many :dishes, through: :box_dishes
end
