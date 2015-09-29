require 'rails_helper'

feature 'user sees show page', %{
  As a signed up user
  I want to edit my information
  So that I can keep it up to date

  Acceptance criteria:
  [] Users can edit info from show page
  [] Users are notified of errors for unsuccessful update
  [] Users are notified of successful update
  [] Users are taken back to show page
} do

  before(:each) do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    click_link "#{@user.email}"
  end

  scenario 'user can edit info show page' do
    find_button('Update Info')
  end

  scenario 'user is shown errors for empty email field' do
    click_button('Update Info')

    fill_in 'Email', with: ""
    click_button('Update')

    expect(page).to have_content("Email can't be blank")
  end

  scenario 'user is notified of successful update' do
    click_button('Update Info')

    fill_in 'Email', with: "foo@bar.com"
    click_button('Update')

    expect(page).to have_content("Profile updated")
  end

  scenario 'user is taken to user show page after successful update' do
    click_button('Update Info')

    fill_in 'Email', with: "foo@bar.com"
    click_button('Update')

    expect(page).to have_content("foo@bar.com")
    expect(current_path).to eq(user_path(@user))
  end

end
