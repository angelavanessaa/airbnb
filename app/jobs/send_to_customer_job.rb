class SendToCustomerJob < ActiveJob::Base
  queue_as :default

  def perform(cust_email, host_email, listing_id, reservation_id)
    ReservationMailer.send_to_customer(cust_email, host_email, listing_id, reservation_id).deliver_now
  end
end
