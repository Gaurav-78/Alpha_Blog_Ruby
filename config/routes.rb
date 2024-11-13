Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]
  resources :articles
    get 'signup', to: 'users#new'
  resources :users, except: [:new]

    get 'login', to: 'sessions#new'
   delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end