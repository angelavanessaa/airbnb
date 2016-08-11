class ReservationsController < ApplicationController
	before_action :require_login
	before_action :set_listing, only: [:show, :edit, :update, :delete]
	
	def index
		@book = Reservation.all
	end

	def show
	end

	def new
		@book = Reservation.new
	end

	def create
		@book = current_user.reservations.new(booking_params)
	end

	def edit
	end

	def update
	end

	def delete
	end

	private
	def booking_params
		#strong params here
	end

	def set_booking
		@book = Reservation.find(params[:id])
	end
end