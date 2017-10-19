Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#welcome'
  get '/about/', to: 'pages#about', as: "about"
  get '/courses/', to: 'pages#courses', as: "courses"

end
