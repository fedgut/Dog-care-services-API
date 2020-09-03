Rails.application.routes.draw do
  resources :users do
    resources :favourites, only: [:create, :update, :destroy, :index]
    resources :services, only: [:create, :destroy, :update]
  end
  resources :services, excpet: [:create, :destroy, :update]
end
