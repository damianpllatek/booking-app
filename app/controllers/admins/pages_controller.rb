# frozen_string_literal: true

module Admins
  class PagesController < ApplicationController
    before_action :find_page, only: [:edit, :update, :destroy]
    layout 'admin'

    access admin: :all

    def index
      @pages = Page.paginate(page: params[:page], per_page: 5).order('created_at DESC')
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

    def published
      @pages = Page.all.published
    end

    def unpublished
      @pages = Page.all.unpublished
    end

    private

    def page_params
      params.require(:page).permit(:title, :seo_title, :content, :state, :photo)
    end

    def find_page
      @page = Page.find(params[:id])
    end
  end
end
