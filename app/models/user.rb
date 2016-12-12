class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tasks
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  PHONE_REGEX = /\A[0-9]*\Z/

  validates :first_name, :last_name, :phone, presence: true, uniqueness: true
  validates :phone, length: {minimum: 10, maximum: 18}
  validates_format_of :phone, with: PHONE_REGEX
  validates :first_name, :last_name, length: {within: 3..15}
end
