class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @likes = Like.new(user_id: @user, post_id: params[:post_id])
    if @likes.save
      @post.increment!(:likes_counter)
      redirect_to user_posts_path(@user, @post)
    else
      flash.now[:error] = 'comment not added'
      @likes.errors.full_messages.join(', ')
    end
  end
end
