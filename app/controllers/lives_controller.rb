class LivesController < ApplicationController
  before_action :ranking

  def index
    @lives = Live.all.page(params[:page]).per(10)
  end

  def show
    @live = Live.find(params[:id])
    @reviews = @live.reviews
    @review = Review.new
  end

  def search
    @search_lives = Live.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
  end

  def ranking
    @ranking = Live.limit(5)
  end
end
