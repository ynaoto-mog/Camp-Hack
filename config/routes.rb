Rails.application.routes.draw do
  get "users/:id" => "users#show"
  post "users/sign_up" => "users#sign_up"
  post "users/sign_in" => "users#sign_in"
  get "insects/question" => "insects#question"
  resources :insects do
    resources :likes, only: [:index, :create]
    resources :comments, only: [:index, :create, :destroy]
  end
  # mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
