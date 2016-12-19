class LivesController < ApplicationController
  before_action :ranking

  def index
    @q = Live.ransack(params[:q])
    @search_lives = @q.result(distinct: true)
  end

  def show
    @live = Live.find(params[:id])
    @reviews = @live.reviews
    @review = Review.new
  end

  def search
    words = params[:q].delete(:title_or_performer_cont)
    if words.present?
      params[:q][:groupings] = []
      words.split(/[ 　]/).each_with_index do |word, i|
        params[:q][:groupings][i] = { title_or_performer_cont: word }
      end
    end
    @q = Live.ransack(params[:q])
    @search_lives = @q.result(distinct: true)
  end

  def ranking
    ranking_ids = Review.group(:live_id).order('count_live_id DESC').limit(5).count(:live_id).keys
    @ranking = ranking_ids.map{ |id| Live.find(id)}
  end
end
