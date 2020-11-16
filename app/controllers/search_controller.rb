class SearchController < ApplicationController
  def users
    @users = User.all

    if params[:search].present?
      @users = @users.where("lower(username) LIKE ?", "%#{params[:search]}%" )
    end
  end
end
