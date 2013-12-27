Mietvertragverwaltung::Application.routes.draw do
  resources :total_square_meters

  resources :rents

  resources :needed_assessory_charges

  resources :needed_heating_charges

  resources :needed_basic_rents

  resources :rooms

  resources :tenants

  root 'application#index'

  get 'rents_eval', as:'rents_evaluation', to: 'rents#eval'
  get 'rents_contract/:id', as:'rents_contract', to: 'rents#contract'
end
