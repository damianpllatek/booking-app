# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :find_booking, only: [:show]

  def index
    @bookings = Booking.all.reverse
  end

  def show; end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
