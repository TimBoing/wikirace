Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server => "/cable"

  root to: 'game_sessions#new'

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

