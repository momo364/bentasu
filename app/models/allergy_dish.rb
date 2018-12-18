class AllergyDish < ActiveRecord::Base
  belongs_to :allergy
  belongs_to :dish
end
