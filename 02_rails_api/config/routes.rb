Rails.application.routes.draw do
  root 'home#index'
  get 'about', to: 'about#index'

  namespace :api do
    get 'status', to: 'status#index'
    get 'consoles', to: 'consoles#index'
  end
end
