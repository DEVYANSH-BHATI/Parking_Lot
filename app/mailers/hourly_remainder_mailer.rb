class HourlyRemainderMailer < ApplicationMailer
	
	def new_order_email(user)

    mail(to: user.email, subject: "<%= @user.first_name%> You got a new order!")
  end

end
