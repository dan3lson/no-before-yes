# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#index'
  get 'index', to: 'static_pages#index'
  get 'how_it_works', to: 'static_pages#how_it_works'
  get 'pricing', to: 'static_pages#pricing'
  get 'support', to: 'static_pages#support'
  get 'about', to: 'static_pages#about'

  get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
  delete '/sign_out' => "clearance/sessions#destroy", as: 'sign_out'
  get '/sign_up' => 'clearance/users#new', as: 'sign_up'

  resources :goals, only: %i[new create]
  resources :stats, only: [:index]
  resource :dashboard, only: [:show], controller: 'dashboard'
  resources :touchpoints
  resources :contacts

  resources :passwords, controller: 'clearance/passwords', only: [:create, :new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users do
    resource :password,
      controller: 'clearance/passwords',
      only: [:edit, :update]
  end
end
