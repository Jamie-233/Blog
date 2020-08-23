Rails.application.routes.draw do
  before_action :authenticate_user!, except: [:index, :show]

  root "posts#index"
  devise_for :admins
  resources :categories
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # get 'users/new'
   # resources :phones
   # root to:"phones#index"

  resources :posts do
    resources :comments
  end
end
