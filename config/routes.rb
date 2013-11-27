SpellableWords::Application.routes.draw do
  root to: "application#index"
  resources :words
  get "/word", to: "words#show"

end
