# frozen_string_literal: true

Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'pages#index'

  resources :pages, only: %i[index show]
  # commentsはpostsと親子関係である
  resources :posts do
    resources :comments
  end
  resources :likes, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
