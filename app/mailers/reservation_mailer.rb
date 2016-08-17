class ReservationMailer < ApplicationMailer
default from: 'dorkysmiles@gmail.com'

  def notification_email(customer, host, listing_id, reservation_id)
    @host = host
    @customer = customer
    @listing = Listing.find(listing_id)
    mail(to: @host, subject: "You have received a booking from #{@customer}")
  end

  def send_to_customer(customer, host, listing_id, reservation_id)
  	@host = host
  	@customer = customer
  	@listing = Listing.find(listing_id)
  	mail(to: @customer, subject: "You have made a reservation at #{@listing.country}")
  end
end