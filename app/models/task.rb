class Task < ActiveRecord::Base
	belongs_to :user
	enum status: { pending: 0, ongoing: 1, completed: 2}
	
	validates :title, :description, :date, presence: true
	validates :description, length: {within: 10..500}
	validates :location, allow_blank: true, length: {maximum: 20, minimum: 4}
end
