Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, only: [:show, :edit, :index]
  get '/home/about' => 'homes#about'
  root 'homes#top' #Sign_in / upはルートに飛ばされる
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
