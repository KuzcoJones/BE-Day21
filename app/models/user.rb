class User < ApplicationRecord
  has_secure_password
  has_many :habits
  has_one :daily 
end
