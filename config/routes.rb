Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#top'

  get 'home/about', to: 'home#about'

  resources :users, only: [:index, :show, :edit, :update]

  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
end
