class PagesController < ApplicationController
  def home
     params[:search] ||= {}
     # @listings = Listing.where(nil)
     @listings = Listing.where.not(latitude: nil, longitude: nil)
     @listings = @listings.where(city: params[:search][:city]) if params[:search][:city].present?
     @listings = @listings.where(category: params[:search][:category]) if params[:search][:category].present?

      @markers = Gmaps4rails.build_markers(@listings) do |listing, marker|
        marker.lat listing.latitude
        marker.lng listing.longitude
        marker.infowindow render_to_string(partial: "/pages/map_box", locals: { listing: listing })
      end
  end
end


