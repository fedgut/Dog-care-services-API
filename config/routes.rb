Rails.application.routes.draw do
  resources :users, only: [:create] do
    resources :favourites, only: [:create, :destroy, :index] 
  end
  resources :services
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  mount Raddocs::App => "/docs", :anchor => false
end
