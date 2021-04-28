# frozen_string_literal: true

module Admins
  class CategoriesController < ApplicationController
    before_action :find_category, only: [:edit, :update, :destroy]
    layout 'admin'

    access admin: :all

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to admins_categories_path, notice: 'Kategoria została utworzona prawidłowo'
      else
        render :new, alert: 'Wystąłpił błąd podczas dodawania kategorii'
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        redirect_to admins_categories_path, notice: 'Kategoria została zaktualizowana prawidłowo'
      else
        render :edit, alert: 'Wystąpił błąd podczas aktualizowania kategorii'
      end
    end

    def destroy
      @category.destroy

      redirect_to admins_categories_path, alert: 'Kategoria została usunięta'
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def find_category
      @category = Category.find(params[:id])
    end
  end
end
