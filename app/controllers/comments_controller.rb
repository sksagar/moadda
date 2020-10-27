class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:comment][:post_id])
    @comments = @post.comments.build(comment_params)
   
    @comments.user_id = current_user.id

    if @comments.save
      redirect_to instagram_profile_path
    else
      render root_url 
    end
  end



  private


  def comment_params
    params.require(:comment).permit(:text,:post_id,:user_id)
  end
end
