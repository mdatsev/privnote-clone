class User < ActiveRecord::Base 
    before_save :encrypt_password
    after_save :clear_password
    def encrypt_password
      if password.present?
        self.salt = BCrypt::Engine.generate_salt
        self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
      end
    end
    def clear_password
      self.password = nil
    end
    def self.authenticate(username_or_email, login_password)
      if EMAIL_REGEX.match(username_or_email)    
        user = User.find_by email: username_or_email
      else
        user = User.find_by username: username_or_email
      end
      if user && user.match_password(login_password)
        return user
      else
        return false
      end
    end   
    def match_password(login_password)
      self.encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
    end
    attr_accessor :password
    EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
    USERNAME_REGEX = /\A\w+\z/
    validates :username, presence: true, uniqueness: true,  format: USERNAME_REGEX
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
    validates :password, confirmation: true
    validates_length_of :password, in: 6..20, on: create
  end