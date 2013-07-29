Entreprenologyproject::Application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
resources :users

end
