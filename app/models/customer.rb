class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  validates :password, presence: {on: :create},
     confirmation: {allow_blank: true} 
  attr_accessor :password, :password_confirmation

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self  
    def authenticate(username,password)
      customer = find_by(username: username)
      if customer && customer.hashed_password.present? &&
        BCrypt::Password.new(customer.hashed_password) == password
        customer
      else
        nil
      end
    end
  end
end
