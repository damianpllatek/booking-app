# frozen_string_literal: true

module Admins
  class PagesController < ApplicationController
    before_action :find_page, only: [:edit, :update, :destroy]
    layout 'admin'

    access admin: :all

    def index
      @pages = Page.all.reverse
    end

    def new
      @page = Page.new
    end

    def create
      @page = Page.new(page_params)

      if @page.save
        redirect_to admins_pages_path, notice: 'Strona została dodana prawidłowo'
      else
        render :new, alert: 'Wystąpił błąd podczas dodawania strony'
      end
    end

    def edit; end

    def update
      if @page.update(page_params)
        redirect_to admins_pages_path, notice: 'Strona została zaktualizowana prawidłowo'
      else
        render :edit, alert: 'Wystąpił błąd podczas aktualizacji strony'
      end
    end

    def destroy
      @page.destroy

      redirect_to admins_pages_path, alert: 'Strona została usunięta'
    end

    private

    def page_params
      params.require(:page).permit(:title, :seo_title, :content, :photo)
    end

    def find_page
      @page = Page.find(params[:id])
    end
  end
end
