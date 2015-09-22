require 'rails_helper'

feature 'user updates review', %{
  As a user
  I want to update reviews
  So that I can change my mind

  Acceptance Criteria
  [] User sees update button
  [] User must fill out form correctly
  [] User will see updated review on dino page if correctly filled
  [] User will see error if form is incorrect

} do

  feature "User is signed in" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
    scenario "visit details page, clicks update button" do
      dino = FactoryGirl.create(:dinosaur)
      FactoryGirl.create(:review, dinosaur_id: dino.id)

      visit dinosaur_path(dino)
      click_link("Update")
      expect(page).to have_content("Update Your Review")
    end

    scenario "User fills out form correctly" do
      dino = FactoryGirl.create(:dinosaur)
      FactoryGirl.create(:review, dinosaur_id: dino.id)

      visit dinosaur_path(dino)
      click_link("Update")
      fill_in("Body", with: "What a nice dinosaur!")
      fill_in("Rating", with: 2)
      click_button("Submit")

      expect(page).to have_content("Review Updated!")
    end

    scenario "User fills out form incorrectly" do
      review = FactoryGirl.create(:review)
      visit dinosaur_path(review.dinosaur)
      click_link("Update")
      fill_in("Body", with: "What a nice dinosaur!")
      fill_in("Rating", with: "t")
      click_button("Submit")

      expect(page).to have_content("Rating Must be between 1 and 5")
    end
  end
end
