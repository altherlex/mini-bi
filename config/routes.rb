Rails.application.routes.draw do
  resources :widgets do 
    get :export, :on=>:member
  end
  resources :panels

  get "start/index"

  resources :columns

  resources :universes do
#    resources :widgets do
#      get :export, on: :member
#    end
  end
  root :to => "start#index"
end
