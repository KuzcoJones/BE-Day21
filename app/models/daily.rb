class Daily < ApplicationRecord
  belongs_to :user
  has_many :habits
  has_many :tags, through: :habits
end
