# frozen_string_literal: true

module Admins
  class BlogsController < ApplicationController
    before_action :find_blog, only: [:edit, :update, :destroy]
    layout 'admin'

    def index
      @blogs = Blog.all
    end

    def new
      @blog = Blog.new
    end

    def create
      @blog = Blog.new(blog_params)

      if @blog.save
        redirect_to admins_blogs_path, notice: 'Dodano post'
      else
        render :new, alert: 'Błąd'
      end
    end

    def edit; end

    def update
      if @blog.update(blog_params)
        redirect_to admins_blogs_path, notice: 'Zaktualizowano post'
      else
        render :edit, alert: 'Błąd'
      end
    end

    def destroy
      @blog.destroy

      redirect_to admins_blogs_path, notice: 'Usunięto post'
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :content, :views)
    end

    def find_blog
      @blog = Blog.find(params[:id])
    end
  end
end
