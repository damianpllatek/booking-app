class Booking < ApplicationRecord
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :email, presence: true
  validates :firstname, presence: true, length: { minimum: 2, maximum: 30 }
  validates :lastname, presence: true, length: { minimum: 2, maximum: 30 }
  validates :street, presence: true
  validates :apartment_number, presence: true
  validates :postcode, presence: true
  validates :city, presence: true, length: { minimum: 2, maximum: 30 }
  validates :rodo, presence: true
  validates :price, presence: true
end
