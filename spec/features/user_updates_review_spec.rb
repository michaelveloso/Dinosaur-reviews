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
      click_button("Update")
      expect(page).to have_button("Update")
    end

    scenario "User fills out form correctly" do
      dino = FactoryGirl.create(:dinosaur)
      FactoryGirl.create(:review, dinosaur_id: dino.id)

      visit dinosaur_path(dino)
      click_button("Update")
      fill_in("Body", with: "What a nice dinosaur!")
      select '2', from: 'Rating'
      click_button("Update")

      expect(page).to have_content("Review Updated!")
    end

    scenario "User fills out form incorrectly" do
      review = FactoryGirl.create(:review)
      visit dinosaur_path(review.dinosaur)
      click_button("Update")
      fill_in("Body", with: "")
      click_button("Update")

      expect(page).to have_content("can't be blank")
    end
  end
end
