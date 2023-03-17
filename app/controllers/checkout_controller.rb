class CheckoutController < ApplicationController
    before_action :authenticate_user!
    require 'stripe'
    Stripe.api_key = 'sk_test_51MlUwASCijQYJMOPQOshlLogVZSBfNDOmpCEnvGEUp8QgvjZqQPwSU1Qozw8zyB7SdTbFkUygrqXW0GNYrzYpWOK00gcDjNzAc'
    def create   
        @company = Company.find(params[:id])
        @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                quantity:1,
                price_data:{
                    currency:"inr",
                    unit_amount:@company.premium.to_i*100,
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
        # @session = Session::Checkout.retrieve(params[:session_id])
        # @line_items = Stripe::Checkout.list_line_items(params[:session_id])
    end
end
