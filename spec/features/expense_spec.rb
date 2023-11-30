require 'rails_helper'

RSpec.describe 'Expenses', type: :feature do
  before(:each) do
    @user = User.create(name: 'New', email: 'new@gmail.com', password: '123123')
    @category = Category.create(name: 'Books', icon: 'bi bi-book', user_id: @user.id)
    @expense = Expense.create(name: 'New Expense', amount: 100, author_id: @user.id, category_id: @category.id)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'Expenses and menu validation' do
    it 'should have Edit account in mene' do
      visit categories_path
      expect(page).to have_content('Edit Account')
    end

    it 'should have Sign out button in menu' do
      visit categories_path
      expect(page).to have_content('Sign Out')
    end

    it 'should have add button' do
      visit categories_path
      expect(page).to have_content('Add New Category')
    end

    it 'shoue have Total part' do
      visit categories_path
      expect(page).to have_content('Total of all categories:')
    end

    it 'should have categories' do
      visit categories_path
      expect(page).to have_content('Categoies')
    end
  end
end
