class User < ApplicationRecord
  has_secure_password
  validates :email, confirmation: { case_sensitive: false }, presence: {message: "Please provide an email"}, uniqueness: {message: "Email is already in use"}, on: :create
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, message: 'is invalid Please provide email in XXX@xxx.xxx format'
  validates :pin, absence: true, on: :create
  has_many :habits
  has_many :habit_tags, through: :habits
  has_many :tags, through: :habit_tags
  has_one :daily, dependent: :destroy
  has_many :daily_habits, through: :daily




  

end
