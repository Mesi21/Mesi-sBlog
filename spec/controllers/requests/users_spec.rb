require './spec/rails_helper'

RSpec.describe 'Users controller', type: :request do
  describe 'GET /index users' do
    it 'renders the index page with all users and template' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
    it 'renders the show page with one the details about 1 user and template' do
      get '/users/2'
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
    it 'checks if correct placeholder is shown' do
      get '/users'
      expect(response.body).to include('index file')
    end
  end
end
