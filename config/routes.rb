Rails.application.routes.draw do
  root "recipes#index"
  resources :food_tags 
  resources :recipes do
    resources :ingredients
  end
end
