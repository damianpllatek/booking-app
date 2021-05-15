# frozen_string_literal: true

class SearchResultsController < ApplicationController
  def index
    @rooms = Room.filter_by_search_results(params[:search_form][:start_date], params[:search_form][:end_date])
  end
end