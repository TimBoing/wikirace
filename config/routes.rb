Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :game_sessions, only: [:new, :create, :show], shallow: true do
    resources :rounds, only: [:index, :new, :create, :show], shallow: true do
      resources :round_participation, only: [:new, :create, :update]
    end
  end

end
