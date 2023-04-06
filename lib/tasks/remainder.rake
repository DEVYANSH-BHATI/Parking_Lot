# namespace :remainder do

# end


# namespace :email_reminders do
#   desc "reminds the user to complete their profile"
#   task :founder_welcome => :environment do
#     if Rails.env == "development"
#       if @user.profile.present?
#         ConfirmMailer.founder_welcome(@user).deliver
#       end
#     end
#   end
# end


namespace :email_reminders do
  desc "reminds the user to complete their profile"
  task :added_new_vehicle => :environment do
    if Rails.env == "development"
      # if @user.profile.present?
      user = User.first
      HourlyRemainderMailer.new_order_email(@vehicle).deliver
      # end
    end
  end
end