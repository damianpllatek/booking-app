# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :find_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @blogs = Blog.where(category_id: params[:id])
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end
end
