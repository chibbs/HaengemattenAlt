class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :sites

  validates :password, length: { minimum: 8 }, allow_nil: true
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  validates :first_name, presence: true

end
