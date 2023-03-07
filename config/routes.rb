Rails.application.routes.draw do
  root 'pages#home'
  # get "/users", to: 'users#index'
  # get "/users/:id", to: 'users#show'
  get "/dashboard", to:"users#admin"
  resources :companies
  resources :policies
  get "otp_form", to:"pages#otp_form"
  post "generate_otp", to:"pages#generate_otp"
  get "otp_verify", to:"pages#otp_verify"
  post "otp_verification", to:"pages#otp_verification"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users ,only: [:index, :show]
end
