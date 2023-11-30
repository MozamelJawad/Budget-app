class Category < ApplicationRecord
  belongs_to :user
  has_many :expenses

  validates :name, presence: true, length: { minimum: 3, maximum: 80 }
  validates :icon, presence: true
end
