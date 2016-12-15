class RankingController < ApplicationController
  layout 'index'
  before_action :ranking
  def ranking
    @ranking = Live.limit(3)
  end
end
