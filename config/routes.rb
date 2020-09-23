Rails.application.routes.draw do
  post "users/sign_up" => "users#sign_up"
  post "users/:id/sign_in/:password" => "users#sign_in"
  resources :insects do
    resources :likes, only: [:index, :create]
    resources :comments, only: [:index, :create, :destroy]
  end
  # mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
