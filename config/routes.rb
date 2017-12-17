Rails.application.routes.draw do
  root to: 'static_pages#home'

  post 'enter', to: 'static_pages#enter'

  resources :events, only: [:new, :create]
end
