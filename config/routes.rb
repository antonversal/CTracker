CurrencyTracker::Application.routes.draw do

  devise_for :users

  root :to => "currencies#index"
  
  resources :countries, :only => :index

  resources :currencies, :only => :index

  post "countries/visited", to: "user_countries#batch_create"
  delete "countries/visited", to: "user_countries#batch_destroy"
end
