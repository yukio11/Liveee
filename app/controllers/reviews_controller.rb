class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: :create
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
      params.require(:review).permit(:rate, :review).merge(live_id: params[:life_id], user_id: current_user.id)
    end
end
