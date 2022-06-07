# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Sessions', type: :request do
  let(:user) { create(:user, password: '123456') }
  let(:user_params) { { email: user.email, password: '123456' } }
  let(:headers) { { 'Accept': 'text/vnd.turbo-stream.html' } }

  describe 'GET /new_session' do
    it 'must return a successful response' do
      get new_user_session_path

      expect(response).to render_template('devise/sessions/new')
    end
  end

  describe 'POST /new_session' do
    it 'must return a successful response' do
      post user_session_path, params: { user: user_params }, headers: headers

      expect(response).to redirect_to(root_path)
    end

    it 'must return a failure response with invalid password' do
      post user_session_path, params: { user: user_params.merge(password: 'invalid') }, headers: headers

      expect(response).to redirect_to(new_user_session_path)
    end

    it 'must return a failure response with invalid email' do
      post user_session_path, params: { user: user_params.merge(email: 'invalid') }, headers: headers

      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'DELETE /session' do
    before do
      sign_in user
    end

    it 'must redirect to login page' do
      delete destroy_user_session_path, headers: headers

      expect(response).to redirect_to(root_path)
    end
  end
end
