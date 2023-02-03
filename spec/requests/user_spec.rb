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
end
