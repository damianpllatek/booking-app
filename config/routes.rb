Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout',
                                                 password: 'secret', confirmation: 'verification', unlock: 'unblock',
                                                 registration: 'register', sign_up: 'cmon_let_me_in' }

  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  #   get 'logout', to: 'devise/sessions#destroy'
  #   get 'password', to: 'devise/passwords#new'
  #   get 'register', to: 'devise/registrations#new'
  # end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'

  namespace :admins do
    resources :pages
    resources :blogs do
      collection do
        get :test
      end
    end
    resources :rooms
    resources :categories
    resources :bookings
  end

  resources :pages, only: [:index, :show]
  resources :blogs, only: [:index, :show]
  resources :rooms, only: [:index, :show]
  resources :categories, only: [:index, :show]
  resources :bookings, except: [:edit, :update, :destroy]
  resources :search_results, only: [:index]
end
