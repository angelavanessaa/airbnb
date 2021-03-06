class ListingsController < ApplicationController

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
  	if current_user
  		@listings = current_user.listings.page(params[:page]).per_page(2)
  	else
  		@listings = Listing.page(params[:page]).per_page(1)
  	end
  end

	def show
 	end
 
	def new
		@listing = Listing.new
 	end
 
 	def create
 	  @listing = current_user.listings.new(listing_params)
      if @listing.save
        redirect_to listing_path(@listing)
      end
 	end
 
 	def edit
 	end
 
 	def update
    @listing.update(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    end
 	end
 
 	def destroy
 	end

  private
  def listing_params
    params.require(:listing).permit(:property_type, :bed_count, :max_people, :bathroom_count, :bathroom_type, :country, :address, :city, :state, :zipcode, :price_per_night, :date_availability_start, :date_availability_end, :user_id, {avatars:[]})
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
  
end
