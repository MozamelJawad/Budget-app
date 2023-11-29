require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before :all do
    @user = User.create(name: 'new', email: 'new@gmail.com', password: '123123')
  end

  describe 'Log in page' do

    it 'should log in with credentials' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(current_path).to match('/')
    end

    it 'should not log in with invalid credentials' do
      visit new_user_session_path
      fill_in 'Email', with: 'aaa@gmail.com'
      fill_in 'Password', with: '123123'
  end

   it 'should not log in without password' do
    visit new_user_session_path
    fill_in 'Email', with: 'kkk'

  end
end
end
