Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  # scope '/api' do    // This would create a prefixe for each
  #   get '/artworks', to: 'artworks#index'
  #   post '/artworks', to: 'artworks#create'
  #   get '/artworks/:id', to: 'artworks#show'
  #   patch '/artworks/:id', to: 'artworks#update'
  #   delete '/artworks/:id', to: 'artworks#destroy'


  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :artworks, only: [:index, :show, :create, :update, :destroy]
  ressource :artwork_shares, only: [:create, :destroy]

end
