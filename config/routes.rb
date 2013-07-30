Entreprenologyproject::Application.routes.draw do
resources :users
resources :sessions, :only => [:new, :create, :destroy]

get 'startups' => 'startups#index'
get 'startups/:id' => 'startups#show', as: "startup"

end
