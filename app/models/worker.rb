class Worker < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  validates :name, presence: true,
    length: {minumum: 1,maximum: 20,allow_blank: true}
  validates :username, presence: true,
    format: { with: /\A[A-Za-z]\w*\z/, allow_blank: true},
    length: { minimum: 2, maximum: 20, allow_blank: true},
    uniqueness: {case_sensitive: false}
  validates :password, presence: {on: :create},
     confirmation: {allow_blank: true} 

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

  class << self  
    def authenticate(username,password)
      worker = find_by(username: username)
      if worker && worker.hashed_password.present? &&
        BCrypt::Password.new(worker.hashed_password) == password
        worker
      else
        nil
      end
    end
  end
end
