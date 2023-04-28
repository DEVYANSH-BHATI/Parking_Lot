# Preview all emails at http://localhost:3000/rails/mailers/hourly_remainder_mailer
class HourlyRemainderMailerPreview < ActionMailer::Preview

	def new_order_email
	    # Set up a temporary order for the preview
	    # vehicle = Vehicle.new(name: "Joe Smith", email: "joe@gmail.com", address: "1-2-3 Chuo, Tokyo, 333-0000", phone: "090-7777-8888", message: "I want to place an order!")
	    vehicle = Vehicle.new(id: 1, number: 'sdf', in_time: DateTime.now, out_time: DateTime.now+10.hours, charges: 20, status: 'left', created_at: DateTime.now, updated_at: DateTime.now, owner: 'watashi', user_id: 1, vehicle_type: 'Car')

	    HourlyRemainderMailer.with(vehicle: vehicle).new_order_email
  	end


end
