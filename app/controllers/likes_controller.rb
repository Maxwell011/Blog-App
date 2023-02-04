class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @likes = Like.new(like_params)
    if @likes.save
      redirect_to user_post_path(@user, @post)
    else
      flash.now[:error] = 'comment not added'
      @likes.errors.full_messages.join(', ')
    end
  end

  private

  def like_params
    { author: current_user, post_id: params.require(:post_id) }
  end
end
