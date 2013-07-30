Entreprenologyproject::Application.routes.draw do
resources :users
resources :startups
resources :sessions, :only => [:new, :create, :destroy]

root :to => "startups#index"

end