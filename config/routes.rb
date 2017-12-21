Rails.application.routes.draw do

  root to: 'events#new'

  post 'enter', to: 'events#enter', as: :enter
  get 'enter', to: redirect('/')

  post :events, to: 'events#create', as: :events

end
