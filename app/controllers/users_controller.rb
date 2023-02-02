class UsersController < ApplicationController
def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

def index
    @users = User.all
  end
end
