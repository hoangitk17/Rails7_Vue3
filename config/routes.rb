# frozen_string_literal: true

Rails.application.routes.draw do
  resources :microposts
  resources :users
  root 'static_pages#home'
  get 'static_pages/home'
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  # get "api/v1/articles/:id", to: "api/v1/articles#show"

  get 'sign_up', to: 'users#new'
  post 'sign_up', to: 'users#create'
  resources :user_sessions, only: %i[new create destroy]

  namespace :api do
    namespace :v1 do
      resources :articles, only: %i[index show]
    end
  end
  scope module: 'api', path: 'api' do
    scope module: 'v1', path: 'v1' do
      resources :comments, only: [:show]
    end
  end

  resources :articles
end
