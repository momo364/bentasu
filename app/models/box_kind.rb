class BoxKind < ActiveRecord::Base
  has_many :boxes, dependent: :destroy
end
