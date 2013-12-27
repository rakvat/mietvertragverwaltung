Mietvertragverwaltung::Application.routes.draw do
  resources :rents

  resources :needed_assessory_charges

  resources :needed_heating_charges

  resources :needed_basic_rents

  resources :rooms

  resources :tenants

  root 'application#index'
end
