# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rooms = Room.all.order('created_at DESC').limit(3)
  end
end