class Admin < User
  validates :pin, uniqueness: true, presence: true, length: { is: 4 }
end
