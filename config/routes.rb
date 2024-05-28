Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :posts, only: [:new, :create, :index]

  root to: 'posts#index'
end
