Rails.application.routes.draw do
  root 'pages#home'
  get "/dashboard", to:"users#admin"
  get "/user_policies", to:"users#user_policies"
  resources :companies
  resources :policies
  get "otp_form", to:"pages#otp_form"
  post "generate_otp", to:"pages#generate_otp"
  get "otp_verify", to:"pages#otp_verify"
  post "otp_verification", to:"pages#otp_verification"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users ,only: [:index, :show]
  # post 'checkout/create', to:'checkout#create'
  # get 'checkout', to:'checkout#show'
  resources :checkout, only: [:create]
  get 'checkout/success', to:'checkout#success'
  # get 'billing', to:'billing#show'
end
