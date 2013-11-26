SpellableWords::Application.routes.draw do
  root to: "application#index"
  resources :games
  get "/words", to: "words#index"
  get "/word", to: "words#show"

end
