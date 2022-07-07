Rails.application.routes.draw do
  get 'home', to: 'home#index'
  get 'about', to: 'about#index'
  get 'status', to: 'status#index'
  get 'consoles', to: 'consoles#index'
end
