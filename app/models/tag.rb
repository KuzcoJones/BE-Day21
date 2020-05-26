class Tag < ApplicationRecord
 validates :title, presence: true, uniqueness: true, length: { in: 5..10 }

 has_many :habit_tags
 has_many :habits, through: :habit_tags
end
