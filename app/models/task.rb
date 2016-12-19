class Task < ActiveRecord::Base
	belongs_to :user
	belongs_to :category

	enum status: {pending: 0, completed: 1, ongoing: 2, overdue: 3}
	
	validates :title, :description, :date, :category, presence: true
	validates :title, :description, uniqueness: true
	validates :description, length: {within: 10..500}
	validates :location, allow_blank: true, length: {maximum: 40, minimum: 4}
	validate 	:task_date_is_in_future

	geocoded_by :location
	after_validation :geocode, if: :location_changed? 

	scope :pending_task, -> {where(status: 0)}
	scope :completed_task, -> {where(status: 1)}
	scope :ongoing_task, -> {where(status: 2)}
	scope :overdue_task, -> {where(status: 3)}
	scope :appointments, -> { joins(:category).where('categories.name = ?', 'appointment')}
	scope :task_category, -> { joins(:category).where('categories.name = ?', 'task')}
	
	def todays_task
		self.date == Date.today
	end

	protected
		def task_date_is_in_future
			if date.present?
				errors.add(:date, "can only be today or a future date") if date < Date.today
			end
		end
end
