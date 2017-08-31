Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :players
  post '/send', to: 'message#send_message'
  post '/receive', to: 'message#receive_message'
end
