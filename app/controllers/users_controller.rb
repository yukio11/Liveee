class UsersController < ApplicationController
  def show
    @user_reviews = current_user.reviews
  end
end
