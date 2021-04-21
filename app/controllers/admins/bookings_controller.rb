#frozen_string_literal: true

module Admins
  class BookingsController < ApplicationController
    before_action :find_booking, only: [:edit, :update, :destroy]
    layout 'admin'

    def index
      @bookings = Booking.all
    end

    def new
      @booking = Booking.new
    end

    def create
      @booking = Booking.new(booking_params)

      if @booking.save
        flash[:notice] = 'Rezerwacja została utworzona prawidłowo'
        redirect_to admins_bookings_path
      else
        flash[:alert] = 'Wystąpił błąd podczas tworzenia rezerwacji'
        render :new
      end
    end

    def edit; end

    def update
      if @booking.update(booking_params)
        flash[:notice] = 'Rezerwacja została zaktualizowana prawidłowo'
        redirect_to admins_bookings_path
      else
        flash[:alert] = 'Wystąpił błąd podczas aktualizowania rezerwacji'
        render :edit
      end
    end

    def destroy
      @booking.destroy

      flash[:alert] = 'Rezerwacja została usunięta'
      redirect_to admins_booking_path
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :email, :firstname, :lastname, :street, 
                                      :apartment_number, :postcode, :city, :rodo, :price)
    end

    def find_booking
      @booking = Booking.find(params[:id])
    end
  end
end
