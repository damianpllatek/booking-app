# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :find_page, only: [:show]

  def index
    @pages = Page.all
  end

  def show; end

  private

  def find_page
    @page = Page.find(params[:id])
  end
end
