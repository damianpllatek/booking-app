class Room < ApplicationRecord
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: { minimum: 3, maximum: 250 }
  validates :description, presence: true, length: { minimum: 10, maximum: 5000 }
  validates :size, presence: true
  validates :base_price, presence: true
end
