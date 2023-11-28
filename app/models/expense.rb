class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category

  validates :name, presence: true, length: { minimum: 3, maximum: 80 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
