class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
	
	def home
		if current_user
			redirect_to dashboard_path
		end
	end

	def dashboard
		@appointments = Task.appointments
		@tasks = Task.todo
		@overdue_tasks = Task.overdue_task
		@pending_tasks = Task.pending_task
		@ongoing_tasks = Task.ongoing_task
		@completed_tasks = Task.completed_task
	end
end