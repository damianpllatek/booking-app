# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]

  def index
    @bookings = Booking.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def show; end

  def new
    @booking = Booking.new
    @room = Room.find(params[:room_id])
  end

  def create
    @booking = Booking.new(booking_params)
    room = Room.find(@booking.room_id)
    @booking.price = (@booking.end_date.to_date - @booking.start_date.to_date).to_i * room.base_price

    if @booking.save
      redirect_to root_path, notice: 'Rezerwacja została utworzona prawidłowo'
    else
      render :new, alert: 'Wystąpił błąd podczas tworzenia rezerwacji'
    end
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:room_id, :start_date, :end_date, :email, :firstname, :lastname, :street,
                                    :apartment_number, :postcode, :city, :rodo)
  end
end
