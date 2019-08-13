Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :subs do
    resources :posts, only: [:new]
  end

  resources :posts, except: [:new] do 
    resources :comments, only: [:new]
  end

  resources :comments, except: [:new]
end