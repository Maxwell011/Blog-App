require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'assigns all posts to @posts' do
      get '/users/1/posts'
      expect(response.body).to include('Hello new Post')
    end
    it 'is a success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end
  end

  context ':show' do
    it('status should be :ok') do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:ok)
    end

    it('rendered :show template') do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it('should assign Post.where(user_id: params[:user_id], id: params[:id]).first to @post') do
      get '/users/1/posts/1'
      expect(assigns(:posts)).to eq(@posts)
    end

    it('response content should contain `@post.title`') do
      get '/users/1/posts/1'
      expect(response.body).to match('This is the first post')
    end
  end
end
