require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    id = 5
    before(:example) { get user_posts_url(id) }

    it 'Return positive response from server' do
      expect(response).to have_http_status(200)
    end

    it 'Renders index template' do
      expect(response).to render_template('index')
    end

    it 'Return text inside index' do
      expect(response.body).to include("This is the list of posts for the user with id of #{id}")
    end
  end
end

describe 'GET /show' do
  before(:example) { get user_path(745) }

  it 'checks if action returns correct response status' do
    expect(response).to have_http_status(:ok)
  end

  it 'checks if action rendered a correct template' do
    expect(response).to render_template('show')
  end

  it 'checks if correct placeholder is shown' do
    expect(response.body).to include('Here is the profile of a particular user')
  end
end
