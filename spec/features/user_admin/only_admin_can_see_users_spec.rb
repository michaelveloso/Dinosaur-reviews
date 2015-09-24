require 'rails_helper'

feature 'admin can see users', %Q{
  As an administrator
  I want to see all the users
  So that I can manage members

  Acceptance criteria
  [] - Non-admins can't see list of users
  [] - Admins can see list of user emails
} do

  feature 'user is valid admin' do

    before(:each) do
      user = FactoryGirl.create(:user_admin)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "Admin can see list of users" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      visit(admin_users_path)
      expect(page).to have_content(user1.email)
      expect(page).to have_content(user2.email)
    end
  end

  feature 'user is not a valid admin' do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "Non-admin can't access admin namespace for features" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)
      visit(admin_users_path)
      expect(page).to have_content("You don't have the privileges to do that!")
      expect(page).to_not have_content(user1.email)
      expect(page).to_not have_content(user2.email)
    end
  end
end
