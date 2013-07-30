Entreprenologyproject::Application.routes.draw do
resources :users
resources :users
resources :sessions, :only => [:new, :create, :destroy]

root :to => "startups#index"

end