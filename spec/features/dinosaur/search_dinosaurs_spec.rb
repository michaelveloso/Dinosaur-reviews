require 'rails_helper'

feature 'Search for dinosaurs by name', %{
  As a user
  I want to search an index of dinosaurs
  So that I can find my favorite

  Acceptance Criteria
  [√] - User sees a search bar on '/dinosaurs'
  [√] - user sees Dino index page with their favorite dino listed
  [√] - Dinosaur names are links to their show pages
  [√] - Dinosaur name and descriptions are visible

} do
  feature "search bar capabilities" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      @dino = FactoryGirl.create(:dinosaur)
      visit dinosaurs_path

      fill_in "search", with: @dino.name
      click_button "Search"
    end

    scenario 'user searches for dinosaur' do
      dino2 = FactoryGirl.create(:dinosaur, name: "Bob" )

      expect(page).to have_content(@dino.name)
      expect(page).to_not have_content(dino2.name)
    end

    scenario 'dinosaur names are links to show pages' do
      click_link (@dino.name)
      expect(current_path).to eq(dinosaur_path(@dino))
    end

    scenario 'dinosaur descriptions and names are visible' do
      expect(page).to have_content(@dino.name)
      expect(page).to have_content(@dino.description)
    end
  end
end
