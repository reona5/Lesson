# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  root to: 'about#index'

  resources :pages, only: %i[index show]
  resources :about, only: [:index]
  # 親子関係
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
