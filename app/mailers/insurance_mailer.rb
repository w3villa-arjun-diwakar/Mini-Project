class InsuranceMailer < ApplicationMailer

  def insurance_purchased(company_id,user)
    @user = user
    @company = Company.find(company_id)
    mail to: user.email
  end

  def insurance_renewed(company_id,user)
    @user = user
    @company = Company.find(company_id)
    @price=@company.premium.to_i
    @discount_price=(@price - (@price*0.1)).to_i
    mail to: user.email
  end

  def send_after_11_months
    @insurance = UserCompany.find(params[:id])
    @insurance_user = @insurance.user.email
    mail(to: @insurance_user, subject: 'Your policy is going to expire in a month')
  end
end
