# namespace :email do
#     desc "Your Policy is going to expire in a month!"
#     task :send_after_11_months => :environment do
#         @usercompany = UserCompany.find(params[:id])
#         future_date = @usercompany.created_at + 11.months
#         if Time.current >= future_date
#             # Define the email content
#             UserMailer.with(user: @usercompany.user).send_after_11_months.deliver_now
#         end       
#       end
# end
