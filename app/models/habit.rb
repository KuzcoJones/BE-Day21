class Habit < ApplicationRecord

  belongs_to :user
  belongs_to :daily, optional: true
  has_many :habit_tags
  has_many :tags, through: :habit_tags
  
end
