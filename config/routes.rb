Rails.application.routes.draw do
  resources :users do
    resources :favourites, only: [:create, :update, :destroy, :index]
    resources :services, only: [:index, :show]
  end
end
