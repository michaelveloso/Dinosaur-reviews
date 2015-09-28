require 'rails_helper'

feature 'user can delete an existing dinosaur', %{
  As an authenticated user
  I want to delete a dinosaur
  So that I can get rid of bad dinosaurs

  Acceptance Criteria
  [√] User can delete dinosaur from show page
  [√] User gets confirmation if dinosaur is deleted
  [√] User is taken to index after successful deletion
  [√] Dinosaur is no longer in database

} do

  feature "User can't delete other users' dinosaurs" do

    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "User can't see delete button from show page" do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit dinosaur_path(dinosaur)

      expect(page).to_not have_content("Exctinctify this dinosaur!")
    end
  end
  feature "User can delete own dinosaurs" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      @dinosaur = FactoryGirl.create(:dinosaur, user: @user)
      visit dinosaur_path(@dinosaur)
    end

    scenario "User can delete dinosaur from show page" do
      find_button "Exctinctify this dinosaur!"
    end

    scenario "User gets confirmation when dinosaur is deleted" do
      click_button "Exctinctify this dinosaur!"

      expect(page).to have_content("Dinosaur extinctified!")
    end

    scenario "User is taken to index when dinosaur is deleted" do
      click_button "Exctinctify this dinosaur!"

      expect(current_path).to eq(dinosaurs_path)
    end

    scenario "Dinosaur does not show up in index after deletion" do
      click_button "Exctinctify this dinosaur!"

      expect(page).to_not have_content(@dinosaur.name)
    end

    scenario "Dinosaur is no longer in database after deletion" do
      this_dino = FactoryGirl.create(:dinosaur, user: @user)
      expect(this_dino).to eq(Dinosaur.last)
      visit dinosaur_path(this_dino)

      click_button "Exctinctify this dinosaur!"

      expect(this_dino).to_not eq(Dinosaur.last)
    end
  end
end
