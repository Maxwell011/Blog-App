require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'User should be not be Valid' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'User should have a name' do
    expect(subject.name).to be_present
  end
  it 'User should have a photo' do
    expect(subject.photo).to be_present
  end
  it 'User should have a bio' do
    expect(subject.bio).to be_present
  end
  it 'Likes Counter attribute should be greater or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'user name should not be more than 250' do
    subject.name = Faker::Lorem.characters(number: 251)
    expect(subject).to_not be_valid
  end
end
