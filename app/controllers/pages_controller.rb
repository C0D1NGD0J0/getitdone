class PagesController < ApplicationController
	def home
		if current_user
			redirect_to dashboard_path
		end
	end

	def dashboard
		@pending_tasks = Task.pending_task
		@ongoing_tasks = Task.ongoing_task
		@completed_tasks = Task.completed_task
	end
end