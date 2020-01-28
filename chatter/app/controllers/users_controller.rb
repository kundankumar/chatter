class UsersController < ApplicationController
  def index
    render json: User.all, status: :ok
  end

  # a) List all user specific tweet
  def tweets
    user = User.find(params[:id])
    render json: user.list_tweets, status: :ok
  end

  def follow_user
    user1 = User.find(params[:user_id1])
    user2 = User.find(params[:user_id2])
    if user1 && user2
      user1.follow(user2)
      render json: user1.followings, status: :ok
    else
      render json: { errors: user1.followings.full_messages }, status: 422
    end
  end

  def followers
    user = User.find(params[:id])
    render json: user.list_followers, status: :ok if user
  end

  def followings
    user = User.find(params[:id])
    render json: user.list_followings, status: :ok if user
  end

  def timeline
    user = User.find(params[:id])
    render json: user.timeline, status: :ok if user
  end


  def create
    user = User.create(user_params)
    if user
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: 422
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
