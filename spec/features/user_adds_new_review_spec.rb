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
  feature "User is not signed in" do
    scenario "user adds review before sigining in" do
      dino = FactoryGirl.create(:dinosaur)

      visit dinosaur_path(dino)

      expect(page).to have_content("Sign In")
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

    scenario "visit details page to see name and details" do
      review = FactoryGirl.create(:review)

      visit dinosaur_path(review.dinosaur)

      expect(page).to have_content(review.dinosaur.name)
      expect(page).to have_content(review.body)
    end

    scenario "User fills out form" do
      dino = FactoryGirl.create(:dinosaur)

      visit dinosaur_path(dino)
      fill_in("Body", with: "What a nice dinosaur!")
      select '2', from: 'Rating'
      click_button("Submit")

      expect(page).to have_content("Review added!")
    end

    scenario "User fills out form incorrectly" do
      dino = FactoryGirl.create(:dinosaur)

      visit dinosaur_path(dino)

      click_button("Submit")
      expect(page).to have_content("can't be blank")
    end
  end
end
