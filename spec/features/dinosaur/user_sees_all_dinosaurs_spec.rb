require 'rails_helper'

feature 'sees index page', %{
  As a user
  I want to view an index of dinosaurs
  So that I can learn about them

  Acceptance Criteria
  [√] - User sees an index if they visit '/dinosaurs'
  [√] - user sees an index if they visit the root
  [√] - Dinosaur names are links to their show pages
  [] - Dinosaur descriptions are visible

} do
  scenario 'user visits index page' do
    dino = FactoryGirl.create(:dinosaur)
    visit dinosaurs_path
    expect(page).to have_content(dino.name)
    expect(page).to have_content(dino.description)
  end

  scenario 'user sees index on root page' do
    dino = FactoryGirl.create(:dinosaur)
    visit root_path
    expect(page).to have_content(dino.name)
  end

  scenario 'dinosaur names are links to show pages' do
    dino = FactoryGirl.create(:dinosaur)
    visit root_path
    click_link (dino.name)
    expect(current_path).to eq(dinosaur_path(dino))
  end

  scenario 'user sees up to ten dinosaurs per page' do
    dinosaurs = FactoryGirl.create_list(:dinosaur, 11)

    visit root_path

    expect(page).to_not have_content(dinosaurs[-1].name)
  end
end
