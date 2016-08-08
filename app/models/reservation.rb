class Reservation < ApplicationRecord
  before_action :require_login
  belongs_to :user
  belongs_to :listing
end
