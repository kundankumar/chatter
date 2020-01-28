class User < ApplicationRecord
  has_many :tweets, dependent: :destroy

  has_many :follow_down,  class_name:  "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :follow_up, class_name:  "Follow", foreign_key: "following_id", dependent: :destroy

  has_many :followers, through: :follow_up, source: :follower
  has_many :followings, through: :follow_down,  source: :following

  # a) list all tweets from specicic user
  def list_tweets
    tweets
  end

  # b) follows other user
 def follow(other_user)
   follow_down.create(following_id: other_user.id)
 end

 # c) list followers
 def list_followers
   followers
 end

 # d) list followings
 def list_followings
   followings
 end

 # e) tweet timeline
 def timeline
   followings.includes(:tweets).map {|u| u.tweets }.flatten
 end


end
