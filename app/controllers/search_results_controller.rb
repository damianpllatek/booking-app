# frozen_string_literal: true

class SearchResultsController < ApplicationController
  def index
    @rooms = Room.all
  end
end