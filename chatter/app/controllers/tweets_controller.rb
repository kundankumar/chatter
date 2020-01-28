class TweetsController < ApplicationController
  def index
    render json: Tweet.all, status: :ok
  end

  def show
    tweet = Tweet.find(params[:id])
    render json: tweet, status: :ok
  end

  def create
    user = User.find(params[:user_id])
    tweet = user.tweets.build(tweet_params) if user
    if tweet.save
      render json: tweet, status: :created
    else
      render json: { errors: tweet.errors.full_messages }, status: 422
    end
  end

  def destroy
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content, :user_id)
  end

end
