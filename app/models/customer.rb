class Customer < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  validates :name, presence: true,
    length: {minumum: 1,maximum: 20,allow_blank: true}
  validates :telephone, presence: true,
    format: { with: /[0-9()-]/, allow_blank: true },
    length: { maximum: 15, allow_blank: true }
  validates :username, presence: true,
    format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true},
    length: { minimum: 2, maximum: 20, allow_blank: true},
    uniqueness: {case_sensitive: false}
  validate :check_email

  validates :password, presence: {on: :create},
     confirmation: {allow_blank: true} 
  attr_accessor :password, :password_confirmation

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  private
  def check_email
    if mail_address.present?
      errors.add(:mail_address, :invalid) unless well_formed_as_email_address(mail_address)
    end
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
