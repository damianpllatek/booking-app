# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :find_page, only: [:show]

  def index
    @pages = Page.all
  end

  def show
    run_counter
  end

  private

  def find_page
    @page = Page.find(params[:id])
  end

  def run_counter 
    # Metoda 1
    # @page.views += 1
    # @page.save

    # Metoda 2
    @page.update(views: @page.views += 1)

  end
end
