class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update]

  def index
    params[:search] ||= {}
    @listings = Listing.where.not(latitude: nil, longitude: nil)
    @listings = @listings.where(city: params[:search][:city]) if params[:search][:city].present?
    @listings = @listings.where(category: params[:search][:category]) if params[:search][:category].present?
    @listings = @listings.where("price <= ?", params[:search][:price]) if params[:search][:price].present?
    @listings = @listings.search_by_title(params[:search][:title]) if params[:search][:title].present?

      @markers = Gmaps4rails.build_markers(@listings) do |listing, marker|
      marker.lat listing.latitude
      marker.lng listing.longitude
      marker.infowindow render_to_string(partial: "/pages/map_box", locals: { listing: listing })
    end
  end

  def show
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.address = "#{@listing.zip} #{@listing.city} Germany"
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing
    else
      render 'edit'
    end
  end



  private

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:title, :description, :zip, :category, :city, :price, :city, :photo, :photo_cache)
    end
end








