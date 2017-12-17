Rails.application.routes.draw do

  root to: 'events#new'

  resources :events, only: [:new, :create]

  get 'enter', to: 'events#enter'
  post 'enter', to: 'events#enter'
end
