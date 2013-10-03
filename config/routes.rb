Pickr::Application.routes.draw do

  devise_for :users
  get "users/show/:id" => "users#show"

  root to: "uploads#index"
  resources :uploads, path: 'pictures'
  get 'uploads/friends' => 'uploads#friend_stream'

end
