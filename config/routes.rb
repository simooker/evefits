Evefits::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users

  resources :users

  resources :fitting do
    member do
      post 'module'
    end
  end

  namespace :api do
    resources :ships, :only => [:index, :show]
    resources :modules, :only => [:index, :show, :types] do
      member do
        get 'types'
      end
    end
  end

  root :to => "home#index"
end