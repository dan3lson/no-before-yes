# frozen_string_literal: true

Rails.application.routes.draw do
  resource :dashboard, only: [:show], controller: 'dashboard'
  resources :touchpoints
  resources :contacts
  resources :users
end
