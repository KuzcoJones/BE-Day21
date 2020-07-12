class Daily < ApplicationRecord
  belongs_to :user
  # add has_many :daily_habits
  has_many :habits
  has_many :tags, through: :habits
end
