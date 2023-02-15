require 'rails_helper'

RSpec.describe 'User Page show', type: :feature do
  before :each do
    @user = User.create(
      name: 'Tommy',
      photo: 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80',
      bio: 'Teacher',
      posts_counter: 3
    )
    @post1 = Post.create(title: 'Hello',
                         text: 'My world',
                         comments_counter: 0,
                         likes_counter: 0,
                         author_id: @user.id)
    @post2 = Post.create(title: 'Hi',
                         text: 'My earth',
                         comments_counter: 0,
                         likes_counter: 0,
                         author_id: @user.id)
    @post3 = Post.create(title: 'Hey',
                         text: 'My universe',
                         comments_counter: 0,
                         likes_counter: 0,
                         author_id: @user.id)
    visit user_path(@user.id)
  end

  it 'shows the profile picture of the user' do
    assert page.has_xpath?("//img[@src = 'https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=712&q=80'
     and @alt='user photo']")
  end

  it 'shows the username' do
    expect(page).to have_content(@user.name)
  end

  it 'shows number of posts written by user' do
    expect(page.body).to have_content(@user.posts_counter.to_s)
  end

  it 'shows last three posts of user' do
    expect(page).to have_content(@post1.text)
    expect(page).to have_content(@post2.text)
    expect(page).to have_content(@post3.text)
  end

  it 'shows button for seeing all posts' do
    expect(page).to have_link('See all posts')
  end

  it 'onclick redirect to posts index' do
    visit user_path(@user)
    click_link 'See all posts'
    expect(page).to have_current_path("/users/#{@user.id}/posts")
  end

  it 'onclick redirect to posts show' do
    visit user_path(@user)
    click_link @posts.id, match: :first
    expect(page).to have_current_path("/users/#{@user.id}/posts/#{@posts.id}")
  end
end
