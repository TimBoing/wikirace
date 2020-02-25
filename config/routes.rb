Rails.application.routes.draw do
  devise_for :users
  root to: 'game_sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :game_sessions, only: [:new, :create, :show], shallow: true do
    resources :rounds, only: [:index, :new, :create, :show], shallow: true do
      resources :round_participation, only: [:new, :create, :edit, :update]
    end
  end

end
