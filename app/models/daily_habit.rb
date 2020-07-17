class DailyHabit < ApplicationRecord
 attribute :completed, :boolean, default: false
 attribute :streak, :string, default: '0'

 belongs_to :habit
 belongs_to :daily
end
