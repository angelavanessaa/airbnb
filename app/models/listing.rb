class Listing < ApplicationRecord
  before_action :require_login
  belongs_to :user
  has_many :reservations
end
