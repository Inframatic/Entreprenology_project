Entreprenologyproject::Application.routes.draw do
resources :interns
resources :startups
resources :sessions, :only => [:new, :create, :destroy]

root :to => 'welcome#index'

end