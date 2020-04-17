Rails.application.routes.draw do
  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  get 'creator/show'
  devise_for :users
  mount ActionCable.server => "/cable"

  resources :game_sessions_quick, only: [:new], shallow: true do
    resources :rounds_quick, only: [:show, :update, :index]
  end

  root to: 'game_sessions#new'
  resource :rules, only: [:show]
  resources :users, only: [:edit, :update, :show]
  resource :path, only: [:show]



  resources :game_sessions, only: [:new, :create, :show], shallow: true do
    resources :messages, only: [:create]
    resources :rounds, only: [:index, :new, :create, :show, :update], shallow: true do
      resources :round_participations, only: [:new, :create, :index] do
        resources :visited_pages, only: [:create, :index]
      end
    end
  end
end

