class Room < ApplicationRecord
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :size, presence: true
  validates :base_price, presence: true

  def self.filter_by_search_results(start_date, end_date)
    query = Room.all
    query = query.joins(:bookings).where('bookings.start_date < ? AND bookings.end_date > ?', start_date.to_date, end_date.to_date)
    # Pokój id: 1
    # Jedna rezerwacja id 1, room id 1
    # Rezerwacja od 02.05 - 03.05
    # Jeśli wyszukiwanie = 02.05 - 03.05 to nie powinniśmy tego znaleźć, bo jest zajęty
    # Jeśłi wyszukiwanie będzie 31-04 - 01.05 to znajdziemy pokój
    # Jeśli wyszukiwanie będzie 03.05 - 05.05 to znajdziemy pokój
  end
end
