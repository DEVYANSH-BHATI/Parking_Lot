class HourlyRemainderMailer < ApplicationMailer


	def every_login(the_user)
		# check if user has any previously parked vehicles then
		# send mailview accordingly else send mail with full data of 
		# parked vehicles
		# @vehicle 

	end
	
	def new_order_email(u)
		# binding.pry

		@vehicle  = params[:vehicle]
		

		# binding.pry
		user =  User.find(@vehicle.user_id)
		# binding.pry
    	mail(to: user.email, subject: user.firstName+" You got a new order!")
  	end


  	def every_hour(users)
  		# a = User.all

  		users.each do |user|
  			# @d = 
  			mail(to: user.email , subject: "Hi! " + user.firstName + " hourly reminder for you.")

  		end


  	end

end
