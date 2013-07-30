Entreprenologyproject::Application.routes.draw do
resources :users
resources :sessions, :only => [:new, :create, :destroy]

post 'startups' => "startups#create"
get 'startups' => 'startups#index'
get 'startups/new' => 'startups#new'
get 'startups/:id' => 'startups#show', as: "startup"

get 'startups/:id/edit' => "startups#edit", as: "edit_startup"
put 'startups/:id' => "startups#update", as: "update_startup"

end