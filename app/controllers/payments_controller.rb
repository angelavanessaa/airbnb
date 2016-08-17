class PaymentsController < ApplicationController
  before_action :require_login

  def new
    @client_token = Braintree::ClientToken.generate
    @reservation = Reservation.find(params[:id])
    @payment = Payment.new
  end

  def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "10.00",
      payment_method_nonce: params[:payment_method_nonce]
    )

    # reserve to save the transaction details into database

    redirect_to user_path(current_user)
  end
end