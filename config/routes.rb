# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#index'

  get 'about', to: 'static_pages#about'
  get 'blog', to: 'static_pages#blog'
  get 'how_it_works', to: 'static_pages#how_it_works'
  get 'index', to: 'static_pages#index'
  get 'pricing', to: 'static_pages#pricing'
  get 'support', to: 'static_pages#support'
  get 'sign_in', to: 'clearance/sessions#new', as: 'sign_in'
  delete 'sign_out', to: 'clearance/sessions#destroy', as: 'sign_out'
  get 'sign_up', to: 'clearance/users#new', as: 'sign_up'

  resources :contacts do
    resources :touchpoints, only: %i[new create], controller: 'contacts/touchpoints'
  end
  resource :dashboard, only: [:show], controller: 'dashboard'
  resources :goals, only: %i[new create]
  resources :onboarding, only: %i[index]
  put 'onboarding', to: 'onboarding#update'
  resources :stats, only: [:index]
  resources :touchpoints

  resources :passwords, controller: 'clearance/passwords', only: %i[create new]
  resource :session, controller: 'clearance/sessions', only: [:create]

  resources :users do
    resource :password,
             controller: 'clearance/passwords',
             only: %i[edit update]
  end
end
