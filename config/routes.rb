Rails.application.routes.draw do
  
  root 'dashboard/generals#index'
  
  mount Dashboard::Engine   => '/visao-geral',  as: 'dashboard',    module: 'dashboard'
  mount Commercial::Engine  => '/comercial',    as: 'commercial',   module: 'commercial'
  mount Deal::Engine        => '/compras',      as: 'deal',         module: 'deal'

end
