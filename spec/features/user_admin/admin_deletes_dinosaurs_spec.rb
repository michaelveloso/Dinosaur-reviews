require 'rails_helper'

feature 'admin can delete dinosaurs', %{
  As an administrator
  I want to delete dinosaurs
  So that I can keep my site friendly

  Acceptance criteria
  [] - Admin sees delete dinosaur button on show page
  [] - After successful deletion, admin is redirected to index
  [] - After successful deletion, admin is notified
} do

  before(:each) do
    user = FactoryGirl.create(:user_admin)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  scenario "Admin sees delete dinosaur button on show page" do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit dinosaur_path(dinosaur)

    find_button "Exctinctify this dinosaur!"
  end

  scenario "After successful deletion, admin is redirected to index" do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit dinosaur_path(dinosaur)

    click_button "Exctinctify this dinosaur!"

    expect(current_path).to eq(dinosaurs_path)

  end

  scenario "After successful deletion, admin is notified" do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit dinosaur_path(dinosaur)

    click_button "Exctinctify this dinosaur!"

    expect(page).to have_content("Dinosaur extinctified!")
  end

  scenario "Dinosaur does not show up in index after deletion" do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit dinosaur_path(dinosaur)

    click_button "Exctinctify this dinosaur!"

    expect(page).to_not have_content(dinosaur.name)
  end

  scenario "Dinosaur is no longer in database after deletion" do
    dinosaur = FactoryGirl.create(:dinosaur)
    expect(dinosaur).to eq(Dinosaur.last)
    visit dinosaur_path(dinosaur)

    click_button "Exctinctify this dinosaur!"

    expect(dinosaur).to_not eq(Dinosaur.last)
  end

end
