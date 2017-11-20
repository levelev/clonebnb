class Listing < ApplicationRecord


  validates :title, :price, :description, :zip, :category, presence: true
  validates :title, uniqueness: true
end
