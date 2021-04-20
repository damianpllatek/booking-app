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
        flash[:notice] = 'Strona została dodana prawidłowo'
        redirect_to admins_pages_path
      else
        flash[:alert] = 'Wystąpił błąd podczas dodawania strony'
        render :new
      end
    end

    def edit; end

    def update
      if @page.update(page_params)
        flash[:notice] = 'Strona została zaktualizowana prawidłowo'
        redirect_to admins_pages_path
      else
        flash[:alert] = 'Wystąpił błąd podczas aktualizacji strony'
        render :edit
      end
    end

    def destroy
      @page.destroy

      flash[:alert] = 'Strona została usunięta'
      redirect_to admins_pages_path
    end

    private

    def page_params
      params.require(:page).permit(:title, :seo_title, :content, :views)
    end

    def find_page
      @page = Page.find(params[:id])
    end
  end
end
