require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create!(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher',
                         posts_counter: 0)
    @post = Post.create!(title: 'Hi', text: 'My world', comments_counter: 0, likes_counter: 0, author_id: @user.id)
    @comment = Comment.create!(text: 'hello yimi', author_id: @user.id, post_id: @post.id)
  end

  it 'checks if attributes are valid' do
    expect(@user).to be_valid
  end

  it 'checks if comment creation is valid' do
    expect(@comment).to be_valid
  end
end
