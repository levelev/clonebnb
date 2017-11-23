class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # def seller
  #  listing.user
  # end
  def seller
    seller = User.find(self.listing.user_id)
  end


end

