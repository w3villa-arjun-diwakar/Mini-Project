class InsuranceMailer < ApplicationMailer

  def insurance_purchased
    @user = params[:user]
    @company = params[:company]
    mail to: @user.email
    # @greeting = "Hi"
  end

  def send_after_11_months
    @insurance = UserCompany.find(params[:id])
    @insurance_user = @insurance.user.email
    mail(to: @insurance_user, subject: 'Your policy is going to expire in a month')
  end
end
