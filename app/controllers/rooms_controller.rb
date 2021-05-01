# frozen_string_literal: true

class RoomsController < ApplicationController
  before_action :find_room, only: [:show]

  def index
    @rooms = Room.all.reverse
  end

  def show; end

  private

  def find_room
    @room = Room.find(params[:id])
  end
end
