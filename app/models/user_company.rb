class UserCompany < ApplicationRecord
  belongs_to :user
  belongs_to :company

  def send_notification 
    @usercompany = UserCompany.find(params[:id])
    @future_date = @usercompany.created_at + 11.months
    if Time.current >= @future_date
      UserMailer.with(user: @usercompany.user).send_after_11_months.deliver_now
    end   
  end
end
 