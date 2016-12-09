class Task < ActiveRecord::Base
	belongs_to :user
	enum status: { pending: 0, ongoing: 1, completed: 2}
	
	validates :title, :description, :date, presence: true
	validates :title, :description, uniqueness: true
	validates :description, length: {within: 10..500}
	validates :location, allow_blank: true, length: {maximum: 40, minimum: 4}

	geocoded_by :location
	after_validation :geocode, if: :location_changed?
end
