class Site < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :sizes
  
  validates :name, presence: true
end
