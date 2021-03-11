class PostsController < ApplicationController
  before_action :authenticate_user!
  

  def create_post
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to instagram_profile_path(current_user.username)
    else
      render profile_image_path
    end
  end


  def find_post
    @post = Post.includes(comments: :user).find(params[:id])
    data = @post.as_json(include: { comments: { include: :user}})
    if @post.user.avatar.attached? 
      data[:user] = {username: @post.user.username, avatar_url: Rails.application.routes.url_helpers.rails_blob_path(@post.user.avatar, only_path: true)}
    else
      data[:user] = {username: @post.user.username}
    end
    render json: data
  end

  private

  def post_params
    params.permit(:image,:caption)
  end 
end
