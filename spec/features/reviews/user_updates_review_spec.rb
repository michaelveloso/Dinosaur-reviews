require 'rails_helper'

feature 'user updates review', %{
  As a user
  I want to update reviews
  So that I can change my mind

  Acceptance Criteria
  [] User can only edit reviews they submitted
  [] User sees update button
  [] User must fill out form correctly
  [] User will see updated review on dino page if correctly filled
  [] User will see error if form is incorrect

} do

  context "User is signed in and owner of review" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      review = FactoryGirl.create(:review, user: user)
      visit dinosaur_path(review.dinosaur)
    end

    scenario "visit details page, clicks update button" do
      click_button("Update")
      expect(page).to have_button("Update")
    end

    scenario "User fills out form correctly" do
      click_button("Update")
      fill_in("Body", with: "What a nice dinosaur!")
      select '2', from: 'Rating'
      click_button("Update")

      expect(page).to have_content("Review Updated!")
    end

    scenario "User fills out form incorrectly" do
      click_button("Update")
      fill_in("Body", with: "")
      click_button("Update")

      expect(page).to have_content("can't be blank")
    end
  end

  context "User is signed in but not owner of review" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      @review = FactoryGirl.create(:review)
      visit dinosaur_path(@review.dinosaur)
    end

    scenario "User doesn't see update button" do
      expect(page.has_no_button?('Update')).to eq(true)
    end

    scenario "User can't visit review edit path" do
      visit edit_review_path(@review)
      expect(current_path).to eq(dinosaur_path(@review.dinosaur))
      expect(page).to have_content("You can't edit this review!")
    end
  end
end
