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

  def search_function
    @search_lives = Live.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
    # @search_lives = Live.search(:title_cont => '%#{params[:keyword]}%').result.page(params[:page]).per(10)
  end

  def ranking
    ranking_ids = Review.group(:live_id).order('count_live_id DESC').limit(5).count(:live_id).keys
    @ranking = ranking_ids.map{ |id| Live.find(id)}
  end
end
