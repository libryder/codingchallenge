Codingchallenge::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resource :home, only: :index

  resources :challenges do
    resources :solutions
  end

  resources :solutions do
    get :up_vote
    get :down_vote
    get :current_vote
  end

  root :to => 'home#index'

end