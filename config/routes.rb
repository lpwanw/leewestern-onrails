# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"

  devise_for :user
  resources :posts, only: %i[index show edit new create update] do
    resource :likes, only: %i[update]
  end
end
