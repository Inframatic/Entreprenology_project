Entreprenologyproject::Application.routes.draw do
resources :users
resources :sessions, :only => [:new, :create, :destroy]

post 'startups' => "startups#create"
get 'startups' => 'startups#index'
get 'startups/new' => 'startups#new'
get 'startups/:id' => 'startups#show', as: "startup"

end