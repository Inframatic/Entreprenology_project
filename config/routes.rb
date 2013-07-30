Entreprenologyproject::Application.routes.draw do
resources :users
resources :sessions, :only => [:new, :create, :destroy]
resources :startups
end
