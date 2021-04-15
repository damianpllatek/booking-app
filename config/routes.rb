Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#index'

  namespace :admins do
    resources :pages
    resources :blogs
  end

  resources :pages, only: [:index, :show]
  resources :blogs, only: [:index, :show]
end
