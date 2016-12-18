class LivesController < ApplicationController
  before_action :ranking

  def index
    @q = Live.search(params[:q])
    @lives = @q.result(distinct: true)
    # @lives = Live.all.page(params[:page]).per(10)
  end

  def show
    @live = Live.find(params[:id])
    @reviews = @live.reviews
    @review = Review.new
  end

  def search
    # @search_lives = Live.where('title LIKE(?)', "%#{params[:keyword]}%").page(params[:page]).per(10)
    @q = Live.search(params[:q])
    @search_lives = @q.result(distinct: true)
    # @search_lives = Live.search(:title_cont => '%#{params[:keyword]}%').result.page(params[:page]).per(10)
  end

  def ranking
    ranking_ids = Review.group(:live_id).order('count_live_id DESC').limit(5).count(:live_id).keys
    @ranking = ranking_ids.map{ |id| Live.find(id)}
  end
end
