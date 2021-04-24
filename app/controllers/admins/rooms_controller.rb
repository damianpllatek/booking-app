# frozen_string_literal: true

module Admins
  class RoomsController < ApplicationController
    before_action :find_room, only: [:edit, :update, :destroy]
    layout 'admin'

    access admin: :all

    def index
      @rooms = Room.all
    end

    def new
      @room = Room.new
    end

    def create
      @room = Room.new(room_params)

      if @room.save
        flash[:notice] = 'Pokój został dodany prawidłowo'
        redirect_to admins_rooms_path
      else
        flash[:alert] = 'Wystąpił błąd podczas dodawania pokoju'
        render :new
      end
    end

    def edit; end

    def update
      if @room.update(room_params)
        flash[:notice] = 'Pokój został zaktualizowany prawidłowo'
        redirect_to admins_rooms_path
      else
        flash[:alert] = 'Wystąpił błąd podczas aktualizowania pokoju'
        render :edit
      end
    end

    def destroy
      @room.destroy

      flash[:alert] = 'Pokój został usunięty'
      redirect_to admins_rooms_path
    end

    private

    def room_params
      params.require(:room).permit(:name, :description, :size, :base_price)
    end

    def find_room
      @room = Room.find(params[:id])
    end
  end
end
