Codingchallenge::Application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :challenges do
    resources :solutions do
      get :up_vote
      get :down_vote
      get :current_vote
    end
  end

  root :to => 'challenges#index'

end