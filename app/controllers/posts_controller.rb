class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = User.find(params[:user_id]).posts.includes(:comments)
  end

  def new
    render :new, locals: { author: current_user, post: Post.new }
  end

  def create
    respond_to do |format|
      format.html do
        @user = current_user
        @post = @user.posts.new(helper_params)
        @post.author_id = current_user.id
        if @post.save
          redirect_to user_posts_path(@user)
        else
          render :new, locals: { author: current_user, post: @post }
        end
      end
    end
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
    @post = Post.find(params[:id])
  end

  private

  def helper_params
    params.require(:post).permit(:title, :text).merge(author_id: current_user.id)
  end
end
