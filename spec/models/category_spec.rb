require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it 'is not valid without a name' do
      category = Category.new(name: nil)
      expect(category).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      category = Category.new(name: 'Be')
      expect(category).to_not be_valid
    end

    it 'is not valid with a name more than 80 characters' do
      category = Category.new(name: 'A' * 90)
      expect(category).to_not be_valid
    end
  end
end
