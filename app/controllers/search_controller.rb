class SearchController < ApplicationController
  def users
    @users = User.all
    @current_user_followings = current_user.following_users
    
    if params[:search].present? && params[:search].length >= 3

      @users = @users.where("lower(username) LIKE ?", "%#{params[:search]}%" )
    else
      redirect_to root_url
    end
  end
end
