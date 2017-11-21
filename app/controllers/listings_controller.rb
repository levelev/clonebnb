class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update]

  def index
    @listings = Listing.all
  end

  def show
  end

  def create
    @listing = Listing.new(listing_params)

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








