# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get "up" => "rails/health#show", as: :rails_health_check

  get "app", to: "app#index"
  get "app/*path", to: "app#index"

  root to: redirect("/app", status: 302)

  devise_for :user
  resources :posts, only: %i[index show edit new create update] do
    resource :likes, only: %i[update]
    resources :comments, only: %i[new create]
  end

  resources :comments, only: %i[show edit update destroy] do
    resource :likes, only: %i[update]
    resources :comments, only: %i[new create]
  end

  resources :users, only: %i[show] do
    member do
      get :modal
      get :confirm_unfollow, to: "follows#confirm_unfollow"
      post :follow, to: "follows#create"
      delete :unfollow, to: "follows#destroy"
    end
  end

  resource :profile, controller: :profile, only: %i[show edit update]
  resources :notifications, only: %i[index] do
    get :follow, :like, :comment, on: :collection
  end

  resource :search, controller: :search, only: %i[] do
    get :user, :post, on: :collection
  end
end
