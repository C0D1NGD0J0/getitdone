class Task < ActiveRecord::Base

	belongs_to :user
	enum status: {pending: 0, ongoing: 1, completed: 2}
	
	validates :title, :description, :date, presence: true
	validates :title, :description, uniqueness: true
	validates :description, length: {within: 10..500}
	validates :location, allow_blank: true, length: {maximum: 40, minimum: 4}
	validate 	:task_date_is_in_future

	geocoded_by :location
	after_validation :geocode, if: :location_changed? 

	scope :pending_task, -> {where(status: 0)}
	scope :ongoing_task, -> {where(status: 1)}
	scope :completed_task, -> {where(status: 2)}
	
	def task_panel(status)
		if status == 'completed'
			return 'panel-success'
		elsif status == 'ongoing'
			return 'panel-primary'
		else
			return 'panel-danger'
		end
	end
	protected
		def task_date_is_in_future
			if date.present?
				errors.add(:date, "can only be today or a future date") if date < Date.today
			end
		end
end
