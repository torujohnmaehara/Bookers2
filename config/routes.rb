Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#new'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:create, :index, :show, :edit, :update]
  get 'home/about' => 'tops#about'
end
