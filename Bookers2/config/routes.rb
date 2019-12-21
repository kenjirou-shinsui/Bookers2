Rails.application.routes.draw do

  get "home/about" => "home#about"
 root 'books#home'

  devise_for :users

resources :books, only: [:create, :index, :show,:destroy,:edit,:update,:delete]

resources :users, only: [:index,:show,:edit,:update]


end
