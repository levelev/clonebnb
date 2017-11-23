class Listing < ApplicationRecord

  mount_uploader :photo, PhotoUploader
  validates :title, :price, :description, :zip, :category, presence: true

  include PgSearch
  pg_search_scope :search_by_title, :against => :title,  :using => {
                    :tsearch => {:prefix => true, any_word: true}
                  }
end
