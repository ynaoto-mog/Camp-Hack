Rails.application.routes.draw do
  root 'insects#index'
  resources :insects do
    resources :comments, only: [:create, :destroy]
  end
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
