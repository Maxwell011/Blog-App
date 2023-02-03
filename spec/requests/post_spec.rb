RSpec.describe 'Posts', type: :request do
  context 'check if the status is success' do
    it 'expect status to be 200 success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:ok)
    end
    it 'expect status to be 200 success' do
      get '/users/1/posts/2'
      expect(response).to have_http_status(:ok)
    end
  end
  context 'should render template' do
    it 'expect users/1/posts to be rendered' do
      get '/users/1/posts'
      expect(response).to render_template('index')
    end
    it 'expect users/1/posts/:id to be rendered' do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
    end
  end
end
