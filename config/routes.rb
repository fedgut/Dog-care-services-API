Rails.application.routes.draw do
  resources :users do
    resources :favourites, only: [:create, :destroy, :index] 
  end
  resources :services
  post 'auth/login', to: 'authentication#authenticate'
end
