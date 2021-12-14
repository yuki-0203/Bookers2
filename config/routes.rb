Rails.application.routes.draw do
devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get "users/show" => "users#show"
  get 'users/index' => "users#index"
  resources :users, only: [:show, :edit, :index, :update ,:new] 
  resources :books
end
  