Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  get "team" => "pages#team"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :comments, only: [:index, :new, :create, :destroy, :edit, :update, :show]
  resources :doctors, only: [:index, :show]
  resources :upvotes, only: [:create, :destroy]
end
