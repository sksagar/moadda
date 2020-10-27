class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.timeline_posts.includes(:user,comments: [:user])
  end
end
