require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validations' do
    it 'is not valid without a name' do
      expense = Expense.new(name: nil, amount: 100_000, author_id: 1, category_id: 1)
      expect(expense).to_not be_valid
    end

    it 'is not valid without an amount' do
      expense = Expense.new(name: 'expense A', amount: nil, author_id: 1, category_id: 1)
      expect(expense).to_not be_valid
    end

    it 'is not valid without an author' do
      expense = Expense.new(name: 'expense A', amount: 100_000, author_id: nil, category_id: 1)
      expect(expense).to_not be_valid
    end

    it 'is not valid without a category' do
      expense = Expense.new(name: 'expense A', amount: 100_000, author_id: 1, category_id: nil)
      expect(expense).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      expense = Expense.new(name: 'Be', amount: 100_000, author_id: 1, category_id: 1)
      expect(expense).to_not be_valid
    end

    it 'is not valid with a name more than 80 characters' do
      expense = Expense.new(name: 'A' * 90, amount: 100_000, author_id: 1, category_id: 1)
      expect(expense).to_not be_valid
    end

    it 'is not valid with a negative amount' do
      expense = Expense.new(name: 'expense A', amount: -100_000, author_id: 1, category_id: 1)
      expect(expense).to_not be_valid
    end
  end
end
