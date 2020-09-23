Rails.application.routes.draw do
  root 'insects#index'
  resources :insects do
    resources :likes, only: [:create]
    resources :comments, only: [:create, :destroy]
  end
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
