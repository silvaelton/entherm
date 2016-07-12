Rails.application.routes.draw do
  
  root 'dashboard/generals#index'
  
  mount Dashboard::Engine   => '/visao-geral',  as: 'dashboard',    module: 'dashboard'
  mount Commercial::Engine  => '/comercial',    as: 'commercial',   module: 'commercial'
  mount Deal::Engine        => '/compras',      as: 'deal',         module: 'deal'
  mount Finance::Engine     => '/financeiro',   as: 'finance',      module: 'finance'

  resources :general_sessions, 	path: 'geral'
  resources :general_profiles, 	path: 'perfil_geral'

  resources :requester_sessions, 	path: 'solicitante'
  resources :requester_profiles, 	path: 'perfil_solicitante'

end
