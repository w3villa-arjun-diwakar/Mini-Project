class PagesController < ApplicationController
    def home
        @policies = Policy.all
    end

    def otp_form    
    end

    def generate_otp
        number = params[:contact_number]
        @@message = rand.to_s[2..5]
        obj=TwilioClient.new.send_text(number,@@message)
        sms= Sm.new
        sms.otp = @@message
        sms.contact_number = number
        sms.save
        @first_value = params[:contact_number]
        session[:passed_variable] = @first_value
        redirect_to otp_verify_path

    end

    def otp_verify

    end

    def otp_verification
        @first_value = session[:passed_variable]
        user_contact_number = @first_value
        current_otp = Sm.where()
        entered_otp = params[:otp]
        if entered_otp.present? && @@message.present?
            if @@message == entered_otp 
                @user = User.where(phone: user_contact_number).first 
                # byebug
                sign_in @user 
                redirect_to root_path
            else
                redirect_to otp_form_path
            end
        end
    end
end
