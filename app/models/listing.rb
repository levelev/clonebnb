class Listing < ApplicationRecord

  mount_uploader :photo, PhotoUploader
  validates :title, :price, :description, :zip, :category, presence: true
end
