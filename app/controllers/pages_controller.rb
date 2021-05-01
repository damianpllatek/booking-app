# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :find_page, only: [:show]

  def index
    @pages = Page.all.reverse
  end

  def show
    run_counter
  end

  private

  def find_page
    @page = Page.find(params[:id])
  end

  def run_counter
    @page.update(views: @page.views += 1)
  end
end
