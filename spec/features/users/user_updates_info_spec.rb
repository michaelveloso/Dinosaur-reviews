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

    expect(page).to have_content("can't be blank")
  end

  scenario 'user is notified of successful update' do
    click_button('Update Info')

    fill_in 'Email', with: "foo@bar.com"
    fill_in 'Current password', with: @user.password
    click_button('Update')

    expect(page).to have_content("Your account has been updated successfully.")
  end

  scenario 'user is taken to dinosaur index after successful update' do
    click_button('Update Info')

    fill_in 'Email', with: "foo@bar.com"
    fill_in 'Current password', with: @user.password
    click_button('Update')

    expect(current_path).to eq(root_path)
  end

  scenario "user changes profile photo" do
    click_button('Update Info')

    attach_file 'Profile Photo',
      "#{Rails.root}/spec/support/images/example_photo.jpg"
    fill_in 'Current password', with: @user.password

    click_button('Update')

    expect(page).to have_content("Your account has been updated successfully.")
  end

end
