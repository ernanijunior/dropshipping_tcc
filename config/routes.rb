Rails.application.routes.draw do

  namespace :site do
    get 'welcome/index'
  end

  namespace :users_backoffice do
    get 'welcome/index' #dashboard
    resources :users
    resources :subjects
    resources :questions
  end

  namespace :admins_backoffice do
    get 'welcome/index' #dashboard
    resources :admins
    resources :subjects
    resources :questions
  end
  devise_for :users
  devise_for :admins

  get 'inicio', to: 'welcome#index'
  root to: 'site/welcome#index'

  resources :stock
  root to: 'stock#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


