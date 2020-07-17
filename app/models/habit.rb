class Habit < ApplicationRecord
  belongs_to :user
  has_many :habit_tags
  has_many :tags, through: :habit_tags
  has_many :daily_habits
end
