# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Passwords', type: :request do
  let(:user) { create(:user, password: '123456') }
  let(:user_params) { { email: user.email } }
  let(:headers) { { 'Accept': 'text/vnd.turbo-stream.html' } }

  describe 'GET /recover_password' do
    it 'must return a successful response' do
      get new_user_password_path

      expect(response).to render_template('devise/passwords/new')
    end
  end

  describe 'POST /recover_password' do
    it 'must send recovery password email' do
      expect { post user_password_path, params: { user: user_params }, headers: }
        .to change { ActionMailer::Base.deliveries.size }.by(1)
    end
  end

  describe 'PUT /recover_password' do
    let(:change_password_params) { { password: 'new_password', password_confirmation: 'new_password' } }

    it 'must update the password' do
      raw, enc = Devise.token_generator.generate(User, :reset_password_token)
      user.update!(reset_password_token: enc, reset_password_sent_at: DateTime.current)
      change_password_params[:reset_password_token] = raw
      put user_password_path, params: { user: change_password_params }, headers: headers
      expect(user.reload.valid_password?('new_password')).to be true
    end
  end
end
