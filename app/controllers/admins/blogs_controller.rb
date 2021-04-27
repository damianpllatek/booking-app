# frozen_string_literal: true

module Admins
  class BlogsController < ApplicationController
    before_action :find_blog, only: [:edit, :update, :destroy]
    before_action :find_category, only: [:new, :edit]
    before_action :find_user, only: [:new, :edit]
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
        redirect_to admins_blogs_path, notice: 'Post został dodany prawidłowo'
      else
        render :new, alert: 'Wystąpił błąd podczas dodawania postu'
      end
    end

    def edit; end

    def update
      if @blog.update(blog_params)
        redirect_to admins_blogs_path, notice: 'Post został zaktualizowany prawidłowo'
      else
        render :edit, alert: 'Wystąpił błąd podczas aktualizacji postu'
      end
    end

    def destroy
      @blog.destroy

      redirect_to admins_blogs_path, alert: 'Post został usunięty'
    end

    private

    def blog_params
      params.require(:blog).permit(:title, :seo_title, :content, :category_id, :user_id, :views)
    end

    def find_blog
      @blog = Blog.find(params[:id])
    end

    def find_category
      @categories = Category.all.pluck(:name, :id)
    end

    def find_user
      @users = User.all.pluck(:email, :id)
    end
  end
end
