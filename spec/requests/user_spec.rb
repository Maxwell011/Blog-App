require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path } # get(:index)
    it 'assigns all users to @users' do
      get users_path
      expect(assigns(:users)).to eq(User.all)
    end
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
  describe ':show' do
    before(:each) do
      @user = User.create(name: 'Victor', posts_counter: 0, photo: '', bio: '')
      get user_path(@user)
    end
    it('status should be :ok') do
      expect(response).to have_http_status(:ok)
    end
    it('should render :show template') do
      expect(response).to render_template(:show)
    end
    it('response content should contain `@user.name`') do
      expect(response.body).to match(`%r{<h3>#{@user.name}</h3>}`)
    end

    it('should assign User.find(params[:id]) to @user') do
      expect(assigns(:user)).to eq(@user)
    end
  end
end
