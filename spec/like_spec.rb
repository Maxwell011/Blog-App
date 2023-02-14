require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher', posts_counter: 1)
    @post = Post.create(title: 'Hi', text: 'My world', comments_counter: 0, likes_counter: 1, author_id: 1)
  end


  it 'checks validity of like present' do
    @like = Like.new(author_id: @user, post_id: @post)
    expect(@like).to_not be_valid
  end

  it 'checks likes counter' do
    Like.create(author_id: @user, post_id: @post)
    expect(@post.likes_counter).to eq 1
  end
end
