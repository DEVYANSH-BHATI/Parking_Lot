class TrialMailer < ApplicationMailer


	def everyminute()
		mail(to: 'user_one.gmail.com', subject: " trial mail with 0 params")
		# mail(to: user.email, subject: user.firstName+" You got a new order!")
	end


end
