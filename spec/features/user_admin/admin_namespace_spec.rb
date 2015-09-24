require 'rails_helper'

feature 'user signs in as admin', %{
  As an administrator
  I want to sign in
  So that I can have access to admin priveleges

  Acceptance criteria
  [] - Administrator sign in to admin Namespace
} do

  feature 'user is valid admin' do

    before(:each) do
      user = FactoryGirl.create(:user_admin)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "Admin can access admin namespace for features" do
      expect(page).to have_content("Admin")
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
      expect(page).to_not have_content("Admin")
    end
  end
end
