Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'welcome#welcome'

  get'/welcome', to: 'welcome#welcome'
  
  get '/contact', to: 'contact#show'

  get '/team', to: 'team#show'  

  get '/test', to: 'test#test'

  resources :gossips do
    resources :comments
  end

  resources :users, only: [:new, :create, :show]

  resources :cities, only: [:show]

  resources :sessions, only: [:new, :create, :destroy]
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
