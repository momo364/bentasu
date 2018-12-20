class Box < ActiveRecord::Base
  belongs_to :order
  belongs_to :box_kind
end
