class Room < ApplicationRecord
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :size, presence: true
  validates :base_price, presence: true
end
