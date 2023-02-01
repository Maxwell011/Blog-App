require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'find responce check' do
    before(:example) { get '/' }
    it 'expect response to be :ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'expect response with users:id' do
      get '/users/1'
      expect(response).to have_http_status(:ok)
    end
  end
  context 'the controller#action renders template' do
    it 'expect to render default template' do
      get '/'
      expect(response).to render_template('index')
    end
    it 'expect to render default template' do
      get '/users/1'
      expect(response).to render_template('show')
    end
  end
  context 'contains the respective content' do
    it 'expect body.response to be here are all users' do
      get '/'
      expect(response.body).to include('here are all users')
    end
    it 'expect body.response to be here are individual users' do
      get '/users/1'
      expect(response.body).to include('here are individual users')
    end
  end
end
