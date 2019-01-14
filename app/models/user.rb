class User < ApplicationRecord
  has_secure_password
  has_many :reviews
  has_many :sites
  
  validates :email, presence: true, uniqueness: true

  Roles = [:admin, :user , :guest]
  validates :role, presence: true

  def is?(requested_role)
      self.role == requested_role
  end

end
