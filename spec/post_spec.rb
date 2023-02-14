require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'hello man') }

  before { subject.save }

  it 'Posts should be not be Valid' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'User post counter to increment' do
    subject.author = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    subject.send(:update_posts_counter)
    expect(subject.author.posts_counter).to be(1)
  end
  it 'Likes Counter attribute should be greater or equal to zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
  it 'Comments Counter attribute should be an integer number' do
    subject.comments_counter = 'some random string'
    expect(subject).to_not be_valid
  end
end
