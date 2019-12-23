Rails.application.routes.draw do
  resources :pprojects
  resources :orgs
  devise_for :users
  root 'home#index'
end
