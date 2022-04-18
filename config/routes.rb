Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get 'run', to: 'pages#run'
  post 'score', to: 'pages#score'
  root to: 'pages#index'
end
