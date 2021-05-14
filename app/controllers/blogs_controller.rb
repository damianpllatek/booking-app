# frozen_string_literal: true

class BlogsController < ApplicationController
  before_action :find_blog, only: [:show]

  def index
    @blogs = Blog.paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def show
    run_counter
  end

  private

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def run_counter
    @blog.update(views: @blog.views += 1)
  end
end
