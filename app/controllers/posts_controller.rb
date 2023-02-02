class PostsController < ApplicationController
def index
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end
  
  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @post = Post.find(params[:post_id])
  end
end
