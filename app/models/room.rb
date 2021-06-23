class Room < ApplicationRecord
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :size, presence: true
  validates :base_price, presence: true

  def self.filter_by_search_results(start_date, end_date)
    requested_dates = (start_date.to_date..end_date.to_date).map{ |date| date }
    available_room_ids = []

    Room.all.each do |room|
      locked_dates = []
      room.bookings.each do |booking|
        locked_dates += (booking.start_date.to_date..booking.end_date).map{ |date| date }
      end

      next if (locked_dates & requested_dates).any?

      available_room_ids << room.id
    end

    Room.where(id: available_room_ids)
  end
end
