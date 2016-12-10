class ReviewsController < ApplicationController
  def index
  end

  def new
    @live = Live.find(params[:life_id])
    @review = Review.new
  end

  def create
    Review.create(create_params)
    redirect_to controller: :lives, action: :index
  end

  private
    def create_params
      params.require(:review).permit(:nickname, :rate, :review).merge(live_id: params[:life_id])
    end
end
