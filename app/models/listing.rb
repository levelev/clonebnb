class Listing < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  mount_uploader :photo, PhotoUploader
  validates :title, :price, :description, :zip, :category, presence: true
end
