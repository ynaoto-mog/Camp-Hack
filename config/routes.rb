Rails.application.routes.draw do
  root 'insects#index'
  resources :insects do
    resources :likes, only: [:index, :create]
    resources :comments, only: [:index, :create, :destroy]
  end
  # mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
