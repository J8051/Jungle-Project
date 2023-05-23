class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, confirmation: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 },presence: true
  validates :password_confirmation, length: { minimum: 8 },presence: true

  def authenticate_with_credentials (email,password)
    user = self.where("email=?",email)
      if user && user.authenticate(password)
        return user 
      end 
    nil 
  end 
end
