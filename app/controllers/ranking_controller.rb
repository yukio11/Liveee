class RankingController < ApplicationController
  layout 'index'
  before_action :ranking
  def ranking
    ranking_ids = Review.group(:live_id).order('count_live_id DESC').limit(3).count(:live_id).keys
    @ranking = ranking_ids.map{|id| Live.find(id)}
  end
end
