class PagesController < ApplicationController
  def home
    params[:search] ||= {}
    @listings = Listing.where(nil)
    @listings = @listings.where(city: params[:search][:city]) if params[:search][:city].present?
    @listings = @listings.where(category: params[:search][:category]) if params[:search][:category].present?
    @listings = @listings.where("price <= ?", params[:search][:price]) if params[:search][:price].present?
  end
end
