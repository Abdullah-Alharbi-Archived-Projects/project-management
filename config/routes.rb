Rails.application.routes.draw do
  resources :tasks
  resources :orgs do 
    resources :projects, controller: 'pprojects' do
      resources :cards
    end
  end
  devise_for :users
  root 'home#index'
end
