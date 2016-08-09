class Reservation < ApplicationRecord
  # before_action :require_login this should be in controller
  belongs_to :user
  belongs_to :listing
end
