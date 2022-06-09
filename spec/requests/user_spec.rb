# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }
  let(:user_params) { attributes_for(:user) }
  let(:headers) { { 'Accept': 'text/vnd.turbo-stream.html' } }

  before do
    sign_in(user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get users_url
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      get edit_user_url(user)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get user_url(user)
      expect(response).to be_successful
    end

    it 'renders the users/show template' do
      get user_url(user)
      expect(response).to render_template('users/show')
    end

    it 'return 404 with invalid user id' do
      get user_url('invalid user id')
      expect(response).to have_http_status :not_found
    end
  end

  describe 'POST /create' do
    it 'renders a successful response' do
      post users_path, params: { user: user_params }
      user_created = User.order(created_at: :desc).first
      expect(response).to redirect_to(user_path(user_created))
    end

    it 'renders users/new if there are errors' do
      post users_path, params: { user: user_params.merge(email: 'invalid_email') }
      expect(response).to render_template('users/new')
    end

    it 'return unprocessable_entity if there are errors' do
      post users_path, params: { user: user_params.merge(email: 'invalid_email') }
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe 'PUT /update' do
    it 'renders a successful response' do
      put user_path(user), params: { user: { email: 'newemail@example.com' } }, headers: headers
      expect(response).to redirect_to(user_path(user))
    end

    it 'must change the email' do
      put user_path(user), params: { user: { email: 'newemail@example.com' } }, headers: headers
      expect(user.reload.email).to eq 'newemail@example.com'
    end

    it 'return unprocessable_entity if there are errors' do
      put user_path(user), params: { user: { email: 'invalid_email' } }
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe 'DELETE /destroy' do
    it 'delete de the user' do
      new_user = create(:user)
      expect { delete user_path(new_user), headers: headers }.to change(User, :count).by(-1)
    end
  end
end
