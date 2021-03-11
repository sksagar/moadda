class SearchController < ApplicationController
  def users
    @users = User.all
    @current_user_followings = current_user.following_users
    
    if params[:search].present?
      @users = @users.where("lower(username) LIKE ?", "%#{params[:search]}%" )
    end
  end
end
