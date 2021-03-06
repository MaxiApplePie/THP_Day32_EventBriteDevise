class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :organiser, class_name: 'User' 
  has_one_attached :img_event
end
