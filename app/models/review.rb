class Review < ApplicationRecord
  belongs_to :site, counter_cache: true
  delegate :name, :to => :site, :prefix => true #-> @review.site_name
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  
  def blank_stars
	5 - rating.to_i
  end
end
