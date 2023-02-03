class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id)
    @post = Post.find(params[:id])
  end
end
