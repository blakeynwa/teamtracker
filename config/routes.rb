Rails.application.routes.draw do

  get 'users/profile'

  get 'teams/index'

#resolve these
  devise_for :users
  as :user do
    get 'users/profile', :to => 'users#profile', :as => :user_root
  end

  resources :teams
end
