Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#welcome'
  get '/about/', to: 'pages#about', as: "about"
  get '/courses/', to: 'pages#courses', as: "courses"
  get '/ethics/:step', to: 'courses#ethics', as: "ethics"
  get '/addpoints/:points', to: 'courses#addpoints', as: "addpoints"
  post '/ethicsm/addanswer', to: 'courses#addanswer', as: "addanswer"

end
