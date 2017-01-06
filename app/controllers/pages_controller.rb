class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
	
	def home
		if current_user
			redirect_to dashboard_path
		end
	end

	def dashboard
		@appointments = current_user.tasks.appointments
		@tasks = current_user.tasks.todo
		@overdue_tasks = current_user.tasks.overdue_task
		@pending_tasks = current_user.tasks.pending_task
		@ongoing_tasks = current_user.tasks.ongoing_task
		@completed_tasks = current_user.tasks.completed_task
	end
end