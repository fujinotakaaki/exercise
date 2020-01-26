Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:create, :destroy, :edit, :index, :show, :update]
  resources :users,  only: [                            :edit, :index, :show, :update]
  get '/home/about' => 'homes#about'
  root to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
