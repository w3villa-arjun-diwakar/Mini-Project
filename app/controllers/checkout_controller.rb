class CheckoutController < ApplicationController
    before_action :authenticate_user!
    require 'stripe'
    Stripe.api_key = 'sk_test_51MlUwASCijQYJMOPQOshlLogVZSBfNDOmpCEnvGEUp8QgvjZqQPwSU1Qozw8zyB7SdTbFkUygrqXW0GNYrzYpWOK00gcDjNzAc'
    def create   
        @company = Company.find(params[:id])
        session[:company] = @company
        
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                quantity:1,
                price_data:{
                    currency:"inr",
                    unit_amount:@company.premium.to_i * 100,
                    product_data:{
                        name:@company.company_name,
                    },
                }
            }],
            mode: 'payment',
            success_url: checkout_success_url,
            cancel_url: root_url,
        })
    end

    def success 
        @company=session[:company]
        @company_id= @company["id"]
        @user_company = UserCompany.new 
        @user_company.user_id = current_user.id 
        @user_company.company_id = @company_id
        if @user_company.save
            InsuranceMailer.insurance_purchased(@company_id,current_user).deliver_later
            flash[:notice] ="Successfully purchased"
            redirect_to root_path
        else 
            flash[:notice] ="Enter again"
            redirect_to checkout_index_path
        end
       
    end
    def renew
        @company = Company.find(params[:id])
        # session[:company] = @company
        @price=@company.premium.to_i
        @discount_price=(@price - (@price*0.1)).to_i
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                quantity:1,
                price_data:{
                    currency:"inr",
                    unit_amount:@discount_price*100,
                    product_data:{
                        name:@company.company_name,
                    },
                }
            }],
            mode: 'payment',
            success_url: renew_payment_url,
            cancel_url: root_url,
        })
    end
    def renew_payment
        @company=session[:company]
        @company_id= @company["id"]
        InsuranceMailer.insurance_renewed(@company_id,current_user).deliver_later
        flash[:notice] ="Insurance Renewed successfully"
        redirect_to root_path
        
    end


end
