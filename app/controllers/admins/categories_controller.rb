# frozen_string_literal: true

module Admins
  class CategoriesController < ApplicationController
    before_action :find_category, only: [:edit, :update, :destroy]
    layout 'admin'

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        flash[:notice] = 'Kategoria została utworzona prawidłowo'
        redirect_to admins_categories_path
      else
        flash[:alert] = 'Wystąłpił błąd podczas dodawania kategorii'
        render :new
      end
    end

    def edit; end

    def update
      if @category.update(category_params)
        flash[:notice] = 'Kategoria została zaktualizowana prawidłowo'
        redirect_to admins_categories_path
      else
        flash[:alert] = 'Wystąpił błąd podczas aktualizowania kategorii'
        render :edit
      end
    end

    def destroy
      @category.destroy

      flash[:alert] = 'Kategoria została usunięta'
      redirect_to admins_categories_path
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def find_category
      @category = Category.find(params[:id])
    end
  end
end
