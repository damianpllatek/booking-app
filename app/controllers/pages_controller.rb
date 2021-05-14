# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :find_page, only: [:show]

  def index
    @pages = Page.paginate(page: params[:page], per_page: 5).order('created_at DESC')
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
