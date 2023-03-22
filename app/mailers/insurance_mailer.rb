class InsuranceMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.insurance_mailer.insurance_purchased.subject
  #
  def insurance_purchased
    @user = params[:user]
    @company = params[:company]
    mail to: @user.email
    @greeting = "Hi"
  end
end
