Finance::Engine.routes.draw do

  resources :cost_centers,  path: 'centro_de_custos'
  resources :bill_categories,    path: 'categorias'

  resources :payables, path: 'contas_a_pagar'
  resources :receivables, path: 'contas_a_receber'

end