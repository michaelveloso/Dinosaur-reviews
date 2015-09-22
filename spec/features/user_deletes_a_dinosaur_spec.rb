require 'rails_helper'

feature 'user can delete an existing dinosaur', %{
  As an authenticated user
  I want to delete a dinosaur
  So that I can get rid of bad dinosaurs

  Acceptance Criteria
  [] User can delete dinosaur from index
  [] User can delete dinosaur from show page
  [] User gets confirmation if dinosaur is deleted
  [] User is taken to index after successful deletion
  [] Dinosaur is no longer in database

} do

  feature "User can delete dinosaurs" do

    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "User can delete dinosaur from index" do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit dinosaurs_path
      click_button "Destroy this dinosaur!"
    end

    scenario "User can delete dinosaur from show page" do
    end

    scenario "User gets confirmation when dinosaur is deleted" do
    end

    scenario "User is taken to index when dinosaur is deleted" do
    end

    scenario "Dinosaur is no longer in database after deletion" do
    end
  end
end
