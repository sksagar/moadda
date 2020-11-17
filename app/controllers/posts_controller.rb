class PostsController < ApplicationController
  before_action :authenticate_user!
  

  def create_post
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to instagram_profile_path
    else
      render profile_image_path
    end
  end


  def find_post
    @post = Post.includes(comments: :user).find(params[:id])
    render json: @post.as_json(include: { comments: { include: :user},user: {except: :avatar}  })
  end

  private

  def post_params
    params.permit(:image,:caption)
  end 
end
