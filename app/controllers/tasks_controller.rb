class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :status]
  before_action :authenticate_user!

  def index
  	@tasks = current_user.tasks
  end

  def new
  	@task = current_user.tasks.build
  end

  def create
  	@task = current_user.tasks.build(task_params)
  	if @task.save
  		flash[:success] = 'Task has been added!'
  		redirect_to root_url
  	else
  		flash.now[:danger] = "Oops!, please try again!"
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @task.update(task_params)
  		flash[:success] = "Task has been updated..."
  		redirect_to edit_task_path(@task)
  	else
  		flash.now[:danger] = "Oops!, please try again"
  		render :edit
  	end
  end

  def destroy
  end

  def status
    @task.update_attributes(status: params[:status])
    redirect_to dashboard_path
  end

  private
  	def set_task
  		@task = Task.find(params[:id])
  	end

  	def task_params
  		params.require(:task).permit(:title, :description, :date, :location, :status, :user_id)
  	end
end
