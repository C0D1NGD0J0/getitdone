namespace :notification do
  desc "Sends sms to user about upcoming tasks/appointments scheduled for the day"
  task sms: :environment do


  end
end
  # Task.all.each do |task|
  # 	if task.date.today?
  # 		# send notification
  			# task.user.phone
  # 	end
  # end

  #  Task.all.each do |task|
  # 	if task.date < Date.today && task.status != 'completed'
  # 		task.status = "overdue"
  # 		task.save
  # 	end
  # end
  	
  	# datetime = DateTime.now.utc
  	# if datetime.hour ==  6 && datetime.minute == 0
  	# # loop over all users
  	# # retrieve all task where Task.
  	# # send sms telling user to login to view tasks for that day

  	# # users.each do |user|
  	# # 	MSG = 'You have "#{user.tasks.count}" task today, login to view tasks details www.getitdone.herokuapp.com'
  	# # 	SmsTool.send_sms(number: user.phone, title: MSG)
  	# # end
  	# end