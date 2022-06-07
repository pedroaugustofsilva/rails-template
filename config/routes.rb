# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }, path_names: {
    sign_in: 'login',
    registration: 'register',
    sign_out: 'logout'
  }

  resources :users
end
