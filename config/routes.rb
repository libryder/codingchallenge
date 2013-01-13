Codingchallenge::Application.routes.draw do
  devise_for :users

  resources :challenges do
    resources :solutions
  end

  root :to => 'challenges#index'

end
