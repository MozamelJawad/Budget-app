require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'Ahmad Ahmadi', email: 'ahmad@gmail.com', password: '123456')
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil, email: 'ahmad@gmail.com', password: '123456')
      expect(user).to_not be_valid
    end

    it 'is valid with valid email' do
      user = User.new(name: 'Ahmad Ahmadi', email: 'ahmad@gmail.com', password: '123456')
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name: 'Ahmad Ahmadi', email: nil, password: '123456')
      expect(user).to_not be_valid
    end

    it 'is valid with valid password' do
      user = User.new(name: 'Ahmad Ahmadi', email: 'ahmad@gmail.com', password: '123456')
      expect(user).to be_valid
    end

    it 'is not valid without a password' do
      user = User.new(name: 'Ahmad Ahmadi', email: 'ahmad@mail.com', password: nil)
      expect(user).to_not be_valid
    end

    it 'is not valid with a password less than 6 characters' do
      user = User.new(name: 'Ahmad Ahmadi', email: 'ahmad@gmail.com', password: '12345')
      expect(user).to_not be_valid
    end

    it 'is not valid with a name less than 3 characters' do
      user = User.new(name: 'Ah', email: 'ahmad@gmail.com', password: '123456')
      expect(user).to_not be_valid
    end

    it 'is not valid with a name more than 80 characters' do
      user = User.new(name: 'A' * 90, email: 'ahmad@example.com', password: '123456')
      expect(user).to_not be_valid
    end
  end
end
