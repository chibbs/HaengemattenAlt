class Site < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :sizes
  belongs_to :user
  has_many_attached :images

  # We need to nest on :images_attachments since :images
  # is a proxy object that, as of today, doesn't support that behavior.
  # see https://matias.svbtle.com/rails-droplets-2-using-activestorage-for-has-many-attached-images-with-nested-forms-and-deletion-part-1
  accepts_nested_attributes_for :images_attachments, allow_destroy: true
  
  validates :name, presence: true
  validates :longitude, presence: true
  validates :latitude, presence: true
  validate :has_one_size_at_least

  def has_one_size_at_least
    if sizes.empty?
      errors.add(:sizes, "need one size at least")
    end
  end
  
  # The method accepts_nested_attributes_for will auto-delete
  # images_attachments for us. Therefore, we need to make sure that the
  # associated blobs get asynchronously purged when that occurs.
  before_update :purge_blobs
  
  scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
  
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
  
  # The post form in our views has a checkbox that marks
  # images_attachments for destruction. We can check if
  # they're marked with `marked_for_destruction?` and
  # delete their associated blobs.
  def purge_blobs
    images_attachments.each do |image_attachment|
      if image_attachment.marked_for_destruction?
        image_attachment.blob.purge_later
      end
	end
  end
end
