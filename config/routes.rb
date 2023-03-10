Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 root 'users#index'
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :create, :new] do
    end
  end

    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  # Defines the root path route ("/")
  # root "articles#index"
end
