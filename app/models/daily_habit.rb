class DailyHabit < ApplicationRecord
 attribute :completed, :boolean, default: false
 attribute :streak, :string, default: '0'

 belongs_to :habit, foreign_key: :habit_id
 belongs_to :daily, foreign_key: :daily_id
end
