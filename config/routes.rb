Entreprenologyproject::Application.routes.draw do
resources :users
resources :sessions, :only => [:new, :create, :destroy]

get 'startups' => 'startups#index'

get 'startups/0' => 'startups#startup0'
get 'startups/1' => 'startups#startup1'
get 'startups/2' => 'startups#startup2'

end
