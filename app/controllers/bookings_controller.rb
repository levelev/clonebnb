class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end


 # POST /listings/:listing_id/bookings
 # POST to create
  def create
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = current_user

    if @booking.save
      # Redirect to Booking success
      redirect_to @booking
    else
      flash[:alert] = "We couldn't create the Booking."
      redirect_to @listing
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :address)
  end
end


