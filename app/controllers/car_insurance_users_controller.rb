class CarInsuranceUsersController < ApplicationController
    before_action :require_user
    def car_insurance_form
        @car_insurance_user = CarInsuranceUser.new
    end

    def create_car_insurance_user 
        @policies = Policy.all
        @car_insurance_user=CarInsuranceUser.new
        @car_insurance_user.name =params[:name]
        @car_insurance_user.email =params[:email]
        @car_insurance_user.phone =params[:phone]
        @car_insurance_user.car_number =params[:car_number]

        if @car_insurance_user.save
            redirect_to @policies.find(2)
        else 
            flash[:notice]="Fill all the details"
            redirect_to  car_insurance_form_path
        end
    end

end
