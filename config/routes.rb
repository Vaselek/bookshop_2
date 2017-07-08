Rails.application.routes.draw do

  get 'rates/create'

  resources :reviews
  root 'books#index'
  get 'books/search'
  resources :images
  resources :authors
  resources :books
  resources :categories
  resources :books do
    resources :rates
  end



  # devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
