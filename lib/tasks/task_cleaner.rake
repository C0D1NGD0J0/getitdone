namespace :task_cleaner do
  desc "Checks the databse for TASKS with date in the past and assigns a status of overdue"
  task overdue: :environment do
  	tasks = Task.all
  	
  end
end
