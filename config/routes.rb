Evefits::Application.routes.draw do
  authenticated :user do
    root :to => 'fitting#index'
  end
  devise_for :users
  resources :users
  resources :characters
  resources :fitting
  namespace :api do
    resources :ships, :only => [:index, :show]
    resources :modules do
      member do
        get 'types'
        get 'attributes'
        get 'effects'
      end
    end
    resources :evecentral, :only => [:marketstat] do
      member do
        get 'marketstat'
      end
    end
    resources :charges, :only => [:index]
    resources :eaal, :only => [:verify] do
      collection do
        post 'verify'
      end
    end
  end

  root :to => "home#index"
end