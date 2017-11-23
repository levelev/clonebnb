class Listing < ApplicationRecord
  geocoded_by :zip
  after_validation :geocode, if: :zip_changed?
  mount_uploader :photo, PhotoUploader
  validates :title, :price, :description, :zip, :category, presence: true
end
