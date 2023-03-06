Rails.application.routes.draw do
  root 'pages#home'
  get 'users/index'
  
  resources :companies
  resources :policies
  get "otp_form", to:"pages#otp_form"
  post "generate_otp", to:"pages#generate_otp"
  get "otp_verify", to:"pages#otp_verify"
  post "otp_verification", to:"pages#otp_verification"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get "users/admin", to:"admins#admin_show"
  
  
  # namespace :admin do
  #   resources :users
  # end
  
 
end
