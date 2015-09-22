require 'rails_helper'

feature 'user adds new review', %{
  As a user
  I want to review dinosaurs
  So that I can share my opinions

  Acceptance Criteria
  [x] User sees the name of the dinosaur and list of reviews
  [x] User must fill out form correctly
  [x] User will see review on dino page if correctly filled
  [x] User will see error if form is incorrect

} do

  scenario "visit details page to see name and details" do
    dino = FactoryGirl.create(:dinosaur)
    review = FactoryGirl.create(:review, dinosaur_id: dino.id)

    visit dinosaur_path(dino)

    expect(page).to have_content(dino.name)
    expect(page).to have_content(review.body)
  end

  scenario "User fills out form" do
    dino = FactoryGirl.create(:dinosaur)

    visit dinosaur_path(dino)
    fill_in("Body", with: "What a nice dinosaur!")
    fill_in("Rating", with: 2)
    click_button("Submit")

    expect(page).to have_content("Review added!")
  end

  scenario "User fills out form incorrectly" do
    dino = FactoryGirl.create(:dinosaur)

    visit dinosaur_path(dino)
    fill_in("Body", with: "What a nice dinosaur!")

    click_button("Submit")
    expect(page).to have_content("can't be blank")
  end

end
