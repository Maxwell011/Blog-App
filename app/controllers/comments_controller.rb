class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(handle_params)
    @comment.author_id = @user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(@user.id, @post)
    else
      render new, locals: { comment: @comment }
    end
  end

  def handle_params
    params.require(:comments).permit(:text)
  end
end
