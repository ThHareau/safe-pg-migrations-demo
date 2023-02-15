Rails.application.routes.draw do
  resources :messages, only: %i[index create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root :to => redirect('/messages')

  # Defines the root path route ("/")
  # root "articles#index"
end
