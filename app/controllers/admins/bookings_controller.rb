#frozen_string_literal: true

module Admins
  class BookingsController < ApplicationController
    before_action :find_booking, only: [:edit, :update, :destroy]
    before_action :find_rooms, only: [:new, :edit]
    layout 'admin'

    access admin: :all

    def index
      @bookings = Booking.all.reverse
    end

    def new
      @booking = Booking.new
    end

    def create
      @booking = Booking.new(booking_params)

      if @booking.save
        redirect_to admins_bookings_path, notice: 'Rezerwacja została utworzona prawidłowo'
      else
        render :new, alert: 'Wystąpił błąd podczas tworzenia rezerwacji'
      end
    end

    def edit; end

    def update
      if @booking.update(booking_params)
        redirect_to admins_bookings_path, notice: 'Rezerwacja została zaktualizowana prawidłowo'
      else
        render :edit, alert: 'Wystąpił błąd podczas aktualizowania rezerwacji'
      end
    end

    def destroy
      @booking.destroy

      redirect_to admins_booking_path, alert: 'Rezerwacja została usunięta'
    end

    private

    def booking_params
      params.require(:booking).permit(:room_id, :start_date, :end_date, :email, :firstname, :lastname, :street,
                                      :apartment_number, :postcode, :city, :rodo, :price)
    end

    def find_booking
      @booking = Booking.find(params[:id])
    end

    def find_rooms
      @rooms = Room.all.pluck(:name, :id)
    end
  end
end
