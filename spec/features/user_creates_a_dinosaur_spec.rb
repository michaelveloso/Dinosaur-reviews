require 'rails_helper'

feature 'user can create a new dinosaur', %{
  As a user
  I want to create a new dinosaur
  So that I can share my favorite dinosaurs

  Acceptance Criteria
  [√] User can navigate to new dinosaur form from index
  [√] User can view form properly
  [√] User gets confirmation if dinosaur is entered correctly
  [√] User gets errors if form is filled out incorrectly
  [√] User gets redirected to show page of created dinosaur

} do

  feature "User is not signed in" do

    scenario "User is asked to sign in before creating a dinosaur" do
      visit new_dinosaur_path
      expect(page).to have_content("Sign Up Sign In")
    end

  end

  feature "User is signed in" do

    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "User can navigate to form from index" do
      visit root_path
      click_link "Create a dinosaur"
      expect(page).to have_content("Create a Dinosaur!")

    end

    scenario "Form fields are visible" do

      visit new_dinosaur_path
      expect(page).to have_content("Name")
      expect(page).to have_content("Location found")
      expect(page).to have_content("Info url")

    end

    feature "User fills out form correctly" do

      scenario "User gets confirmation that dinosaur was added" do
        dinosaur = FactoryGirl.build(:dinosaur)
        visit new_dinosaur_path
        fill_in "Name", with: dinosaur.name
        fill_in "Location found", with: dinosaur.location_found
        fill_in "Info url", with: dinosaur.info_url
        click_button "Create a Dinosaur!"
        expect(page).to have_content("Dinosaur added!")
      end

      scenario "User is taken to show page" do
        dinosaur = FactoryGirl.build(:dinosaur)
        visit new_dinosaur_path
        fill_in "Name", with: dinosaur.name
        fill_in "Location found", with: dinosaur.location_found
        fill_in "Info url", with: dinosaur.info_url
        click_button "Create a Dinosaur!"
        expect(page).to have_content(dinosaur.name)
        expect(page).to have_content(dinosaur.location_found)
      end

      scenario "Dinosaur is visible in index" do
        dinosaur = FactoryGirl.build(:dinosaur)
        visit new_dinosaur_path
        fill_in "Name", with: dinosaur.name
        fill_in "Location found", with: dinosaur.location_found
        fill_in "Info url", with: dinosaur.info_url
        click_button "Create a Dinosaur!"
        visit root_path
        expect(page).to have_content(dinosaur.name)
      end
    end

    feature "User fills out form incorrectly" do

      scenario "User sees error messages" do
        visit new_dinosaur_path
        click_button "Create a Dinosaur!"
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Location found can't be blank")
        expect(page).to have_content("Info url can't be blank")
      end

      scenario "User stays on form page" do
        visit new_dinosaur_path
        click_button "Create a Dinosaur!"
        expect(page).to have_content("Name")
        expect(page).to have_content("Location found")
        expect(page).to have_content("Info url")
      end

    end
  end
end
