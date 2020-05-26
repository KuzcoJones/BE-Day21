class HabitTag < ApplicationRecord
  belongs_to :habit
  belongs_to :tag
end
