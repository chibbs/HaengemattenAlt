class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :sites
  
  validates :email, presence: true, uniqueness: true
end
