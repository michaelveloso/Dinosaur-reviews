require 'rails_helper'

feature 'user deletes account', %{
  As a signed up user
  I want to delete my account
  So that I can leave the site

  Acceptance criteria:
  [] Users can delete account from show page
  [] Users are notified of successful delete
  [] Users are taken back to dinosaurs index page
} do

  before(:each) do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    click_link "#{@user.email}"
  end

  scenario 'user can delete account from show page' do
    find_button('Delete Account')
  end

  scenario 'user is notified of successful deletion' do
    click_button('Delete Account')

    expect(page).to have_content("Account deleted")
  end

  scenario 'user is taken to root page after deletion' do
    click_button('Delete Account')

    expect(current_path).to eq(root_path)
  end
end
