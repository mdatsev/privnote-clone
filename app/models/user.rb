class User < ActiveRecord::Base
    def self.authenticate(username_or_email, login_password)
      if EMAIL_REGEX.match(username_or_email)    
        user = User.find_by email: username_or_email
      else
        user = User.find_by username: username_or_email
      end
      if user && BCrypt::Password.new(user.password_digest).is_password?(login_password)
        return user
      else
        return false
      end
    end
    attr_accessor :remember_token
    EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
    USERNAME_REGEX = /\A\w+\z/
    validates :username, presence: true, uniqueness: true,  format: USERNAME_REGEX
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
    has_secure_password
    def User.new_token
      SecureRandom.urlsafe_base64
    end
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, BCrypt::Password.create(remember_token))
    end
    def authenticated?(remember_token)
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
  end