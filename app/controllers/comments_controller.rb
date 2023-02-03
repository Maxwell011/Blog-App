class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(handle_params)
    @comment.user_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = 'Succesfully created a comment'
      redirect_to user_post_path(@user.id, @post)
    else
      flash.new[:error] = 'encountered an error'
      render new, locals: { comment: @comment }
    end
  end

  def handle_params
    params.require(:my_comment).permit(:text)
  end
end
