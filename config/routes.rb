Codingchallenge::Application.routes.draw do
  devise_for :users

  resources :challenges do
    resources :solutions do
      get :up_vote
      get :down_vote
      get :current_vote
    end
  end

  root :to => 'challenges#index'

end
