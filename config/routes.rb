Rails.application.routes.draw do

  get 'teams/index'

#resolve these 
  devise_for :users
  resources :teams
end
