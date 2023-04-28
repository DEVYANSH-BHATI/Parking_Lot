



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

# u = Vehicle.where('in_time > ?',24.hours.ago  ).pluck(:user_id)
# namespace :email_reminders do
namespace :remainder do
  desc "reminds the user to complete their profile"
  # task :AddedNewVehicle => :environment do
  task :added_new_vehicle => :environment  do
    if Rails.env == "development"
      # if @user.profile.present?
      # user = User.first
      # u = Vehicle.where('in_time > ?',1.day  )
      # binding.pry
      # HourlyRemainderMailer.new_order_email().deliver
      TrialMailer.everyminute.deliver
      # HourlyRemainderMailer.new_order_email(@vehicle).deliver
      # end
    end
  end
end
# end


# desc " hourly reminder"
# task :hourly do
#   HourlyRemainderMailer.
# end


namespace :remainder do
  desc "Print reminder about eating more fruit."
  task :pineapple do
    puts "Eat more apples!"
    pp DateTime.now.utc.in_time_zone('Asia/Kolkata')
  end
end