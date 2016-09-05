Rails.application.routes.draw do

  root 'home#index'

  get 'home/index'

  get 'black_jack/index'
  get 'black_jack/new'
  get 'black_jack/show'
  get 'black_jack/hit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
