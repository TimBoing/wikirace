Rails.application.routes.draw do
  devise_for :users
  root to: 'game_sessions#new'

  resources :users, only: [:edit, :update]

  resources :game_sessions, only: [:new, :create, :show], shallow: true do
    resources :messages, only: [:create]
    resources :rounds, only: [:index, :new, :create, :show], shallow: true do
      resources :round_participations, only: [:new, :create, :update] do
        resources :visited_pages, only: [:new, :create]
      end
    end
  end
  resources :round_participations, only: [:create]
end
