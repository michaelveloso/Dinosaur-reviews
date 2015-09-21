require 'rails_helper'

feature 'user visits show page', %Q{
  As a user
  I want to view the details of a dino
  So that I can learn more about it

  Acceptance Criteria
  [x] User sees the name and location found of the dinosaur
  [x] User does not see other dinosaur's details

} do

  scenario "visit details page to see name and details" do
    dino = FactoryGirl.create(:dinosaur)

    visit "dinosaurs/#{dino.id}"

    expect(page).to have_content(dino.name)
    expect(page).to have_content(dino.location_found)

  end

  scenario "User does not see other dino's details" do
    dino = FactoryGirl.create(:dinosaur)
    dino_two = FactoryGirl.create(:dinosaur)

    visit "dinosaurs/#{dino.id}"

    expect(page).to have_content(dino.name)
    expect(page).to_not have_content(dino_two.name)
  end
end
