class ReservationsController < ApplicationController
	before_action :require_login
	before_action :set_listing, only: [:show, :edit, :update, :delete]
	
	def index
		@book = Reservation.all
	end

	def show
	end

	def new
		@reservation = Reservation.new
		@listing = Listing.find(params[:listing_id])
	end

	def create
		@book = current_user.reservations.new(booking_params)
		if @book.save
			redirect_to user_path(current_user)
		end
	end

	def edit
	end

	def update
	end

	def delete
	end

	private
	def booking_params
		params.require(:reservation).permit(:user_id, :listing_id, :check_in_date, :check_out_date, :number_of_people)
	end

	def set_booking
		@book = Reservation.find(params[:id])
	end
end
