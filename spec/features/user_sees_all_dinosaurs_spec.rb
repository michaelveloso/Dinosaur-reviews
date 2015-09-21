require 'rails_helper'

feature 'sees index page', %{
  As a user
  I want to view an index of dinosaurs
  So that I can learn about them

  Acceptance Criteria
  [] - User sees an index if they visit '/dinosaurs'
  [] - user sees an index if they visit the root
  [] - Dinosaur names are links to their show pages

} do
  scenario 'user visits index page' do
    dino = FactoryGirl.create(:dinosaur)
    visit dinosaurs_path
    expect(page).to have_content(dino.name)
  end

  scenario 'user sees index on root page' do
    dino = FactoryGirl.create(:dinosaur)
    visit root_path
    expect(page).to have_content(dino.name)
  end

  # scenario 'user clicks dino name' do
  #   dino = FactoryGirl.create(:dinosaur)
  #   visit dinosaurs_path
  #   click_link(dino.name)
  #   expect(page).to have_content(dino.name)
  #   expect(page).to have_content(dino.location_found)
  # end
end
