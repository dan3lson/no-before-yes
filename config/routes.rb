# frozen_string_literal: true

Rails.application.routes.draw do
  resources :touchpoints
  resources :contacts
  resources :users
end
