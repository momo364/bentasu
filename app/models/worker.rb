class Worker < ActiveRecord::Base
  attr_accessor :password, :password_confirmation

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
