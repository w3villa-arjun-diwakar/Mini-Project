class LifeInsuranceUsersController < ApplicationController
    before_action :require_user
    def life_insurance_form
        @life_insurance_user = LifeInsuranceUser.new
    end

    def create_life_insurance_user 
        @policies = Policy.all
        @life_insurance_user=LifeInsuranceUser.new
        @life_insurance_user.name =params[:name]
        @life_insurance_user.age =params[:age]
        @life_insurance_user.phone =params[:phone]
        @life_insurance_user.gender =params[:gender]

        if @life_insurance_user.save
            redirect_to @policies.find(1)
        else 
            flash[:notice]="Fill all the details"
            redirect_to  life_insurance_form_path
        end
    end
end
