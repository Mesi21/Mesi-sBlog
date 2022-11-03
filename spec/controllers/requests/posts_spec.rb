require './spec/rails_helper'

RSpec.describe 'Posts controller', type: :request do
  describe 'GET /index posts' do
    before(:each) do
      @user = User.new(name: 'Mesi', posts_counter: 0)
      @user.save
      get '/users/1/posts'
    end
    it 'checks if action returns correct response status and template' do
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end
    it 'renders the show page with one the details about a post' do
      get '/users/2'
      expect(response).to have_http_status(200)
      expect(response).to render_template('show')
    end
    it 'checks if correct placeholder is shown' do
      get '/users'
      expect(response.body).to include('index file')
    end
  end

  describe 'GET /show' do
    before(:each) do
      @user = User.new(name: 'Mesi', posts_counter: 0)
      @post = Post.new(title: 'My Rails Journey', text: 'Description', comments_counter: 3, likes_counter: 1,
                       user_id: 1)
      @user.save
      @post.save
    end

    it 'renders the correct template - show action' do
      get '/users/1/posts/1'
      expect(response).to render_template(:show)
    end

    it 'render the show page for posts of a user' do
      get '/users/1/posts/2'
      expect(response.body).to include('details about it')
    end
  end
end
