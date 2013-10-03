Pickr::Application.routes.draw do

  devise_for :users

  root to: "uploads#index"
  resources :uploads, path: 'pictures'

end
