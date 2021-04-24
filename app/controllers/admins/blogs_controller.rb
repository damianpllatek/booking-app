# frozen_string_literal: true

module Admins
  class BlogsController < ApplicationController
    before_action :find_blog, only: [:edit, :update, :destroy]
    layout 'admin'

    access admin: :all

    def index
      @blogs = Blog.all
    end

    def new
      @blog = Blog.new
    end

    def create
      @blog = Blog.new(blog_params)

      if @blog.save
        flash[:notice] = 'Post został dodany prawidłowo'
        redirect_to admins_blogs_path
      else
        flash[:alert] = 'Wystąpił błąd podczas dodawania postu'
        render :new
      end
    end

    def edit; end

    def update
      if @blog.update(blog_params)
        flash[:notice] = 'Post został zaktualizowany prawidłowo'
        redirect_to admins_blogs_path
      else
        flash[:alert] = 'Wystąpił błąd podczas aktualizacji postu'
        render :edit
      end
    end

    def destroy
      @blog.destroy

      flash[:alert] = 'Post został usunięty'
      redirect_to admins_blogs_path
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :seo_title, :content, :views)
    end

    def find_blog
      @blog = Blog.find(params[:id])
    end
  end
end
