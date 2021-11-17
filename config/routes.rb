Rails.application.routes.draw do
  # get 'person/new'
  # get 'person/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "articles#index"

  # get "/articles", to: "articles#index", as: "article_index"
  # get "/articles/:id", to: "articles#show", as: "article"

  #organization
   resources :organization
   get 'get_dataset', to: 'organization#get_dataset'
   post "organization", to: "organization#store", as: "organization_store"
   
   #person
   get "organization/person/:id", to: "person#new", as: "organization_new"
   post "organization/person", to: "person#store", as: "person_store"
   delete "person/:id", to: "person#delete", as: "person_delete"

   #user
   resources :user
   get 'get_user', to: 'user#get_user'
   post 'user/create', to: 'user#create'
   
   #auth
   get '/login', to: 'auth#form_login', as: 'form_login'
   post '/login', to: 'auth#login', as: 'login_post'
   root to: 'home#index', as: 'home_index'
   get '/logout/:id', to: 'auth#logout', as: 'user_logout'

end
