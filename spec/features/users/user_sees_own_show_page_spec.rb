require 'rails_helper'

feature 'user sees show page', %{
  As a signed up user
  I want to see my information
  So that I can check that it's up to date

  Acceptance criteria:
  [] Users can click on their email to get to their show page
  [] I want to see my information on the show page
  [] I don't want other users to see update or delete buttons
} do

  before(:each) do
    @user = FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'

    click_link "#{@user.email}"
  end

  scenario 'user can click on email to get to show page' do
    expect(current_path).to eq(user_path(@user))
  end

  scenario 'expect to see information on show page' do
    expect(page).to have_content(@user.email)
  end

  scenario 'no other users can see update or delete buttons' do
    new_user = FactoryGirl.create(:user)
    visit user_path(new_user)

    expect(page).to_not have_content("Update")
    expect(page).to_not have_content("Delete")
  end
end
