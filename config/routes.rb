Rails.application.routes.draw do

  root 'books#index'
  resources :images
  resources :authors
  resources :books
  resources :categories


  # devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
