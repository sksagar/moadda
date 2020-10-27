class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @current_user_followers = current_user.follower_users
    @current_user_followings = current_user.following_users
    @posts = current_user.posts

    @all_comments = Post.first.comments.includes(:user) 
  end

  def image
    if current_user.update(avatar: params[:avatar])
      redirect_to instagram_profile_path
    else
      redirect_to instagram_profile_path
    end
  end

end
