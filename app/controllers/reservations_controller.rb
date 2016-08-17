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
		@host = "dorkysmiles@gmail.com"
		@reservation = current_user.reservations.new(booking_params)
		# ReservationMailer.notification_email(current_user.email, @host, @reservation.listing.id, @reservation.id).deliver_later
		ReservationJob.perform_later(current_user.email, @host, @reservation.listing.id, @reservation.id)
		SendToCustomerJob.perform_later(current_user.email, @host, @reservation.listing.id, @reservation.id)
		if @reservation.save
			# redirect_to user_path(current_user)
			redirect_to payments_new_path + "?id=" + @reservation.id.to_s
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
