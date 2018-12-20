class BoxDish < ActiveRecord::Base
  belongs_to :box
  belongs_to :dish
end
