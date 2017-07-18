Rails.application.routes.draw do

  root to: 'companies#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/dashboard'  => 'companies#dashboard'
  get '/jobs' => 'jobs#jobs'

  resources :categories

  resources :companies do
    resources :contacts
  end

  resources :companies do
    resources :jobs do
      resources :comments
    end
  end

  resources :jobs, only: [:show] do
  resources :comments, shallow: true

  end
end
