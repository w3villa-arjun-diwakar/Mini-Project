class ApplicationController < ActionController::Base
   respond_to :html, :ajax

    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    config.autoloader = :classic

    protected

     def logged_in?
          !!current_user 
     end
     def require_user
          if !logged_in? 
              flash[:alert] = "You must be logged in"
              redirect_to user_session_path
          end
     end
     def after_sign_in 
          if logged_in? 
               flash[:alert] = "You successfully signed in"
               redirect_to policy_path
          end
     end
     def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone, :gender, :age)}
          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :phone, :gender, :age, :avatar)}
     end
end
