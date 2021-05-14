# frozen_string_literal: true

module Admins
  class RoomsController < ApplicationController
    before_action :find_room, only: [:edit, :update, :destroy]
    layout 'admin'

    access admin: :all

    def index
      @rooms = Room.paginate(page: params[:page], per_page: 6).order('created_at DESC')
    end

    def new
      @room = Room.new
    end

    def create
      @room = Room.new(room_params)

      if @room.save
        redirect_to admins_rooms_path, notice: 'Pokój został dodany prawidłowo'
      else
        render :new, alert: 'Wystąpił błąd podczas dodawania pokoju'
      end
    end

    def edit; end

    def update
      if @room.update(room_params)
        redirect_to admins_rooms_path, notice: 'Pokój został zaktualizowany prawidłowo'
      else
        render :edit, alert: 'Wystąpił błąd podczas aktualizowania pokoju'
      end
    end

    def destroy
      @room.destroy

      redirect_to admins_rooms_path, alert: 'Pokój został usunięty'
    end

    private

    def room_params
      params.require(:room).permit(:name, :description, :size, :base_price, :photo)
    end

    def find_room
      @room = Room.find(params[:id])
    end
  end
end
