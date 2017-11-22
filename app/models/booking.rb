class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # def seller
  #  listing.user
  # end
  def seller
     seller = User.find(self.listing.user_id)
     seller.name || seller.first_name + " " + seller.last_name
  end


end

