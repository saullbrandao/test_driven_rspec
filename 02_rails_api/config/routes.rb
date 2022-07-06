Rails.application.routes.draw do
  get 'status', to: 'status#index'
  get 'consoles', to: 'consoles#index'
end
