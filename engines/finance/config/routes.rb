Finance::Engine.routes.draw do

  resources :cost_centers,  path: 'centro_de_custos'
  resources :bill_categories,    path: 'categorias'

  resources :payables, path: 'contas_a_pagar' do 
    collection do 
      get 'update', to: 'payables#update_parcel', as: 'update'
    end
  end

  resources :receivables, path: 'contas_a_receber'

  resources :reports do 
    collection do 
      get 'general',  path: 'geral'
      get 'contract', path: 'por-contrato'
    end
  end
end
