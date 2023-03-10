class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    config.autoloader = :classic
    protected
     def logged_in?
          !!current_user 
     end
     def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone, :gender, :age)}
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :phone, :gender, :age)}
     end
end
