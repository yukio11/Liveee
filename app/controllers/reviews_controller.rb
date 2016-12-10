class ReviewsController < ApplicationController
  def index
  end

  def new
    @live = Live.find(params[:life_id])
    @review = Review.new
  end
end
