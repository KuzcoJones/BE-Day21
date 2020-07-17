class Daily < ApplicationRecord
  belongs_to :user
  has_many :daily_habits
  has_many :habits, through: :daily_habits
  has_many :tags, through: :habits
end
