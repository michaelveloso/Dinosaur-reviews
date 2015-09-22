require 'rails_helper'

feature 'user can update a dinosaur', %{
  As a user
  I want to update a dinosaur
  So that I can keep it up to date

  Acceptance Criteria
  [] - Dinosaur show page should have a link to edit page
  [] - Form should be displayed correctly
  [] - Form fields are filled in with current dinosaur's values
  [] - Edit page has link to show page
  [] - Edit page has link to index
  [] - User gets confirmation upon correct update
  [] - User is taken to show page on correct update
  [] - User gets errors on incorrect update
  [] - User stays on edit page if there are errors

} do
  scenario 'show page should have a link to edit page' do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit dinosaur_path(dinosaur)
    click_link 'Edit this dinosaur!'
    expect(page).to have_content("Edit this dinosaur!")
  end

  scenario 'form should be displayed correctly' do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit edit_dinosaur_path(dinosaur)
    expect(page).to have_content("Name")
    expect(page).to have_content("Location found")
    expect(page).to have_content("Info url")
  end

  scenario 'form is pre-filled with current values' do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit edit_dinosaur_path(dinosaur)
    expect(page).to have_content(dinosaur.name)
    expect(page).to have_content(dinosaur.location_found)
    expect(page).to have_content(dinosaur.info_url)
  end

  scenario 'edit page has link to show page' do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit edit_dinosaur_path(dinosaur)
    click_link "Back to dinosaur!"
    current_path.should == dinosaur_path(dinosaur)
  end

  scenario 'edit page has link to index' do
    dinosaur = FactoryGirl.create(:dinosaur)
    visit edit_dinosaur_path(dinosaur)
    click_link "Back to home"
    current_path.should == dinosaurs_path
  end

  feature 'user enters information correctly' do

    scenario 'user gets confirmation of update' do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit edit_dinosaur_path(dinosaur)
      fill_in "Name", with: "New Name"
      fill_in "Location found", with: "Idaho"
      fill_in "Info url", with: "www.example.com"
      click_button "Change this dinosaur!"
      expect(page).to have_content("Dinosaur changed!")
    end

    scenario 'user is taken to show page' do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit edit_dinosaur_path(dinosaur)
      fill_in "Name", with: "New Name"
      fill_in "Location found", with: "Idaho"
      fill_in "Info url", with: "www.example.com"
      click_button "Change this dinosaur!"
      current_path.should == dinosaur_path(dinosaur)
      expect(page).to have_content("New Name")
      expect(page).to have_content("Idaho")
      expect(page).to have_content("www.example.com")
    end

  end

  feature 'user enters information incorrectly' do

    scenario 'user gets errors' do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit edit_dinosaur_path(dinosaur)
      fill_in "Name", with: ""
      fill_in "Location found", with: ""
      fill_in "Info url", with: ""
      click_button "Change this dinosaur!"
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Location found can't be blank")
      expect(page).to have_content("Info url can't be blank")
    end

    scenario 'user stays on page' do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit edit_dinosaur_path(dinosaur)
      fill_in "Name", with: ""
      fill_in "Location found", with: ""
      fill_in "Info url", with: ""
      click_button "Change this dinosaur!"
      expect(page).to have_content("Name")
      expect(page).to have_content("Location found")
      expect(page).to have_content("Info url")
    end
  end
end
