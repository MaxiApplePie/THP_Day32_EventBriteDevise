class User < ApplicationRecord
  has_many :attendances
  has_many :events, through: :attendances
  has_many :organised_events, foreign_key: 'organiser', class_name: 'Event'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
