require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @user = User.create(name: 'Tom', photo: '', posts_counter: 0)
    @post = Post.create(
      author_id: @user,
      title: 'Here we are!',
      text: 'Here they go',
      comments_counter: 0,
      likes_counter: 0
    )
    Comment.create(author_id: @user, post: @post, text: 'Hello bob')
    Comment.create(author_id: @user, post: @post, text: 'Hello gram')
    Comment.create(author_id: @user, post: @post, text: 'Hello sam')
  end
  describe 'GET /index' do
    before(:example) { get user_posts_path(@user) } # get(:index)
    it 'assigns all posts to @posts' do
      expect(assigns(:posts)).to eq(Post.all)
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
end
