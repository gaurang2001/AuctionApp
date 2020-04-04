Rails.application.routes.draw do
  
  # Custom registrations controller to be used
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :products do
    member do
      patch :bb
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes to /products when localhost:3000 is opened
  # GET products
  root 'products#index'

  get 'products/bid'
  post 'products/bid'
  
  match 'products/:id' => 'products#bid', :as => :bid, via: :post

  

end
