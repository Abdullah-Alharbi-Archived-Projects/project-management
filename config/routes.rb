Rails.application.routes.draw do
  resources :orgs do 
    resources :projects, controller: 'pprojects'
  end
  devise_for :users
  root 'home#index'
end
