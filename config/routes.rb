Rails.application.routes.draw do

  get 'users/profile'

  get 'teams/index'

#resolve these
  devise_for :users
  as :user do
    get 'users/profile', :to => 'users#profile', :as => :user_root
  end

  resources :teams
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :players
  post '/send', to: 'message#send_message'
  post '/receive', to: 'message#receive_message'

  resources :games
end
