class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :configure_permitted_parameters, if: :devise_controller?
#     def after_sign_in_path
#           if user_signed_in?
#                redirect_to policy_path
#           end
          
#     end

     def require_user
          if !user_signed_in? 
               flash[:alert] = "you must be logged in!"
               redirect_to new_user_session_path
          end
     end

    protected

         def configure_permitted_parameters
              devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :phone, :gender, :age)}
              devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :phone, :gender, :age)}
         end
end
