require 'rails_helper'

feature 'admin can delete users', %{
  As an administrator
  I want to delete users
  So that I can manage members

  Acceptance criteria
  [] - Non-admins can't delete users
  [] - Admins can delete users from index page
} do

  before(:each) do
    user = FactoryGirl.create(:user_admin)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario "Admin can see delete button on user index page" do
    user1 = FactoryGirl.create(:user)
    visit admin_users_path
    find_button("Exctinctify #{user1.email}!")
  end

  scenario "Admin sees confirmation after deleting user" do
    user1 = FactoryGirl.create(:user)
    visit(admin_users_path)
    click_button("Exctinctify #{user1.email}!")

    expect(page).to have_content("User extinctified!")
  end

  scenario "Deleted user does not appear on index page" do
    user1 = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    visit(admin_users_path)
    click_button("Exctinctify #{user1.email}!")

    expect(page).to_not have_content(user1.email)
    expect(page).to have_content(user2.email)
  end

  scenario "Deleted user is no longe in database" do
    user1 = FactoryGirl.create(:user)
    expect(user1).to eq(User.last)
    visit(admin_users_path)
    click_button("Exctinctify #{user1.email}!")

    expect(user1).to_not eq(User.last)
  end

end
