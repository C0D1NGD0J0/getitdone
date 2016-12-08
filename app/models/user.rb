class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :phone, presence: true, uniqueness: true
  validates :phone, length: {maximum: 12, minimum: 10}
  validates :first_name, :last_name, length: {within: 3..15}
end
