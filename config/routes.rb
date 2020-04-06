Rails.application.routes.draw do
  
  # Custom registrations controller to be used
  devise_for :users, controllers: { registrations: 'registrations'}
  resources :products do
    member do
      patch :bb
      patch :claimed_by
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Routes to /products when localhost:3000 is opened
  # GET products
  root 'products#index'

  # GET products/bid 
  get 'products/bid'

  # GET home/claim => displays products claimed by the user
  get 'home/claim'

  # GET home/myprod => displays products uploaded by the user
  match 'home/myprod' => 'home#myprod', :as => :myprod, via: :get

  # POST products/:id => directs to bid.html.erb
  match 'products/:id' => 'products#bid', :as => :bid, via: :post

  # POST home/claim => updates products claimed by the user
  match 'home/claim' => 'home#claim', :as => :claim, via: :post

end
