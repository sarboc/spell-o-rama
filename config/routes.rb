SpellableWords::Application.routes.draw do
  root to: "application#index"
  resources :words

end
