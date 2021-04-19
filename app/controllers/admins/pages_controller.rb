# frozen_string_literal: true

module Admins
  class PagesController < ApplicationController
    before_action :find_page, only: [:edit, :update, :destroy]
    layout 'admin'

    def index
      @pages = Page.all
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to admins_pages_path, notice: 'Dodano stronę'
      else
        render :new, alert: 'Błąd'
      end
    end

    def edit; end

    def update
      if @page.update(page_params)
        redirect_to admins_pages_path, notice: 'Zaktualizowano stronę'
      else
        render :edit, alert: 'Błąd'
      end
    end

    def destroy
      @page.destroy

      redirect_to admins_pages_path, notice: 'Usunięto stronę'
    end

    private

    def page_params
      params.require(:page).permit(:title, :content, :views)
    end

    def find_page
      @page = Page.find(params[:id])
    end
  end
end
