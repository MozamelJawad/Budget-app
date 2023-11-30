require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  before(:each) do
    @user = User.create(name: 'New', email: 'new@gmail.com', password: '123123')
    @category = Category.create(name: 'Books', icon: 'bi bi-book', user_id: @user.id)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'category validation' do
    it 'should have add new category button' do
      visit categories_path
      expect(page).to have_content('Add New Category')
    end

    it 'shoue have Total of all categories part' do
      visit categories_path
      expect(page).to have_content('Total of all categories:')
    end

    it 'should have categories' do
      visit categories_path
      expect(page).to have_content('Categoies')
    end
  end
end
