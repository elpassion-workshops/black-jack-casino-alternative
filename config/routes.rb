Rails.application.routes.draw do

  devise_for :users, controllers: { :omniauth_callbacks => 'users/omniauth_callbacks' }
  root 'home#index'

  get 'home/index'

  get 'black_jack/index'
  get 'black_jack/new'
  get 'black_jack/:id', to: 'black_jack#show', as: 'black_jack'
  get 'black_jack/:id/hit', to: 'black_jack#hit', as: 'black_jack_hit'
  get 'black_jack/:id/stand', to: 'black_jack#stand', as: 'black_jack_stand'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
