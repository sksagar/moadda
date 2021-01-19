class LikesController < ApplicationController

  def create_like

    if Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
      render json: {success: false,error: "you have already liked this post"}
    else
      @like = Like.new(like_params)
      @like.user_id = current_user.id
      
      if @like.save
        render json: {success: true}
      else
        render json: {success: false, error: @like.errors.full_messages}
      end
    end
  end

  def unlike
    if Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
      @unlike = Like.where(user_id: current_user.id, post_id: params[:post_id]).first.destroy
  
      render json: {success: true}
    else
      render json: {success: false}
    end
    
  end


  private

  def like_params
    params.permit(:user_id,:post_id)
  end
end
