class Daily < ApplicationRecord
  belongs_to :user
  has_many :habits
end
