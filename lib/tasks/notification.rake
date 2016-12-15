namespace :notification do
  desc "Sends sms to user about upcoming tasks/appointments scheduled for the day"
  task sms: :environment do
  	tasks = Task.all
  	notification_msg = "Login into your daily-task dashboard to view all your task for today"
		
		tasks.each do |task|
			if task.date.today?
  			SmsTool.send_sms(
  				number: task.user.phone,
  				title: notification_msg
  			)
			end
		end
  end
end