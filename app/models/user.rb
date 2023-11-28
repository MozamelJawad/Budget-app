class User < ApplicationRecord
  has_many :categories
  has_many :expenses

  validates :name, presence: true, length: { minimum: 3, maximum: 80 }
end
