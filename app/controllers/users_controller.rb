class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.find(params[:id])
    @follow = Follow.where(follower_id: current_user.id ,following_id: params[:id])
    @followers = @user.follower_users
    @followings = @user.following_users
    @current_user_followings = current_user.following_users
    @other_user_posts = @user.posts
    @all_comments = Post.first.comments.includes(:user)
  end

   def follow
    if params[:following_id].to_i == current_user.id
      render json: { success: false, error: "can't follow yourself" } and return
    end

    if Follow.where(follower_id: current_user.id, following_id: params[:following_id]).exists?
      render json: {success: false, error: "you have already followed this user"}
    else
      @follow = Follow.create(follower_id: current_user.id ,following_id: params[:following_id])
      #render json: @follow 
      render json: { success: true,following_id: params[:following_id] }
    end

  end

  def unfollow
    @unfollow = Follow.where(follower_id: current_user.id, following_id: params[:following_id]).first.destroy

    render json: {success: true,following_id: params[:following_id]}
  end

  
end
