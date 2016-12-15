class LivesController < ApplicationController
  def index
    @lives = Live.all.page(params[:page]).per(10)
  end

  def search
    @search_lives = Live.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
  end
  # GET /lives/1
  # GET /lives/1.json
  def show
    @live = Live.find(params[:id])
    @reviews = @live.reviews
    @review = Review.new
  end


end
