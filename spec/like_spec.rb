require 'rails_helper'

RSpec.describe Like, type: :model do
  @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Like.new(author: @user) }

  before { subject.save }

  it 'likes should be not be Valid' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
  it 'Post likes counter can be set' do
    subject.post = Post.new(author: @user, title: 'Post One', text: 'This is the post one')
    subject.send(:update_likes_counter)
    expect(subject.post.likes_counter).to be(1)
  end
end
