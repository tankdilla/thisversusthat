Thisversusthat::Application.routes.draw do
  resources :showdowns do
    resources :votes
    resources :comments
  end

  resources :topics do
    resources :votes
  end

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users do
    resources :comments
  end
end