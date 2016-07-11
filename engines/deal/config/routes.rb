Deal::Engine.routes.draw do
  resources :supplier_categories
  resources :suppliers
  resources :orders
  
  resources :control_orders do 
    resources :order_comments
  end
  
  resources :products
  
  resources :purchases do 
    get 'fpa'
  end

  resources :inventories, path: 'estoque'
  
  resources :inventory_logs, path: 'logs' do 
    collection do 
      get 'add_item'
      get 'remove_item'
    end
  end

  resources :patrimonies
  resources :patrimony_moviments do 
    get 'view'
  end
  
  resources :quotations
  resources :searches

  resources :reports, only: [:index] do 
    collection do 
      get 'contracts',    path: 'geral', to: 'reports#contracts', as: 'contracts'
      get 'by_contract',  path: 'por-contrato', to: 'reports#by_contract', as: 'by_contract'
      get 'by_products',  path: 'por-produtos', to: 'reports#by_products', as: 'by_products'
    end
  end

  get '/dashboard', path: 'visao-geral', to: 'dashboard#index', as: 'dashboard'
end
