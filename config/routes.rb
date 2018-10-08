Rails.application.routes.draw do

  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get '/posts', to: 'posts#index'
  resources :posts
end
