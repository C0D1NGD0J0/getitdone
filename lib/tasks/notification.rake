namespace :notification do
  desc "Sends sms to user about upcoming tasks/appointments planned for the day"
  task sms: :environment do
  	# Schedule to run everyday at 6am if task available for that day
  	# Iterate over all users
  	# Send a message that has link about daily task
  	User.all.each do |user|
  		SmsTool.send_sms()
  	end
  end
end
