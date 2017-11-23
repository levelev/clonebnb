class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  # def seller
  #  listing.user
  # end
  def seller
    seller = User.find(self.listing.user_id)
    if seller.name != nil
      return seller.name
    elsif seller.first_name != nil && seller.last_name != nil
      seller_name. = seller.first_name + " " + seller.last_name
      return seller_name
    else
      return "noname"
    end
  end


end

