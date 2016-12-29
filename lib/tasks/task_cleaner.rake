namespace :task_cleaner do
  desc "Checks the databse for TASKS with date in the past and assigns a status of overdue"
  task overdue: :environment do
  	Task.all.each do |task|
  		if (task.date < Date.today) && (task.status == "pending")
  			task.status = 'overdue'
  			task.save
  			puts "#{task.status} -- TASK STATUS AFTER SAVE"
  		end    	
  	end
  end
end