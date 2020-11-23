class HomeController < ApplicationController
  before_action :authenticate_user!

  LIMITS_PER_PAGE = 10

  def index
    @posts = current_user.timeline_posts.includes(:user,comments: [:user])

    @page = (params[:page] || 1).to_i

    @rows = @posts.count

    @total_pages = (@rows / LIMITS_PER_PAGE).ceil

    @posts = @posts.offset((@page - 1) * LIMITS_PER_PAGE).limit(LIMITS_PER_PAGE)
    html_str = ''
    @posts.each do |home_post|
      
      html_str += render_to_string(partial: "post",locals: {home_post: home_post},layout: false)
    end
    respond_to do |format|
      format.html
      format.json { render json: {success: true, post: html_str.html_safe} }
    end

  end
end
