# frozen_string_literal: true

Rails.application.routes.draw do
  root 'dashboard#show'

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  resources :stats, only: [:index]
  resource :dashboard, only: [:show], controller: 'dashboard'
  resources :touchpoints
  resources :contacts

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end
end
