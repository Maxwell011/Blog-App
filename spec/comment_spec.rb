require 'rails_helper'

RSpec.describe Comment, type: :model do
  @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Comment.new(text: 'hello man') }

  before { subject.save }

  it 'comments should be not be Valid' do
    subject.text = nil
    expect(subject).to_not be_valid
  end
  it 'Post comments counter can be set' do
    subject.post = Post.new(author: @user, title: 'Post One', text: 'This is the post one')
    subject.send(:update_comments_counter)
    expect(subject.post.comments_counter).to eq(1)
  end
end
