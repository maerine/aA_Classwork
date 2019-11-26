require 'bcrypt'

class User < ApplicationRecord

  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true
  # validates :password, length: { minimum: 6, allow_nil: true}

  before_validation :ensure_session_token

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
   password_digest = BCrypt::Password.create(password)

  end

  def is_password?(password)
    password_digest.is_password?(password)
  end
  
  def self.find_by_credentials(user_name, password)
    if is_password?(password)
      @user[user_name]
    end
  end
  
end
