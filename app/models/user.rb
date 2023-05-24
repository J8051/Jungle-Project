class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 }, presence: true
  validates :password_confirmation, length: { minimum: 8 }, presence: true

  def self.authenticate_with_credentials(email,password)
    user = User.where("lower(email) = ?", email.downcase.strip).first
      if user && user.authenticate(password)
        return user 
      else 
        return nil 
      end 
  end 
end
