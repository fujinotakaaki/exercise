Rails.application.routes.draw do
  devise_for :users
  resources :books #, only: [:new, :create, :index, :show, :destroy]
  #root設定まだ
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
