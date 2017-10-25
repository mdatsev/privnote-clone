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
    attr_accessor :password
    EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
    USERNAME_REGEX = /\A\w+\z/
    validates :username, presence: true, uniqueness: true,  format: USERNAME_REGEX
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
    validates :password, confirmation: true
    validates_length_of :password, in: 6..20, on: create
  end