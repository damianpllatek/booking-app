# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @rooms = Room.all.order('created_at DESC').limit(3)
    @blogs = Blog.all.published.order('created_at DESC').limit(3)
    @pages = Page.all.published.order('created_at DESC').limit(3)
  end
end