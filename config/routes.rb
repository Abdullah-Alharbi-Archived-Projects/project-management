Rails.application.routes.draw do
  resources :orgs do 
    resources :projects, controller: 'pprojects' do
      resources :cards do
        resources :tasks
      end
    end
  end
  devise_for :users
  root 'home#index'
end
