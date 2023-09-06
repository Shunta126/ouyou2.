Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :create, :update]do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  get '/home/about', to: 'homes#about', as: 'about'

  get "search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

