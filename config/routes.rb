Pickr::Application.routes.draw do

  resources :friendships, only: [:create, :destroy]
  devise_for :users
  get "profile/:id" => "users#show", as: 'profile'

  root to: "uploads#index"
  resources :uploads, path: 'pictures'
  get 'friends/uploads' => 'uploads#friend_stream'

end
