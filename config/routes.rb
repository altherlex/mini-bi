Rails.application.routes.draw do
  resources :widgets


  resources :panels


  get "start/index"

  resources :columns


  resources :universes
  root :to => "start#index"

end
