# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :find_blog, only: [:show]

  def index
    @blogs = Blog.all
  end

  def show; end

  private

  def find_blog
    @blog = Blog.find(params[:id])
  end
end
