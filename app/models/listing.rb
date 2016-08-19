class Listing < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :reservations

  mount_uploaders :avatars, AvatarUploader
  searchkick match: :word_start, searchable: [:city, :country]
end
