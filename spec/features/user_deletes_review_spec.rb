require 'rails_helper'

feature 'user deletes review', %{
  As a user
  I want to delete reviews
  So that I can change my mind

  Acceptance Criteria
  [] User deletes review
  [] User doesn't see review after it's deleted

} do

  feature "User is signed in" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end
    scenario "visit details page, clicks delete button" do
      dino = FactoryGirl.create(:dinosaur)
      review = FactoryGirl.create(:review, dinosaur_id: dino.id)

      visit dinosaur_path(dino)
      click_link "Delete"
      expect(page).to have_content("Review deleted!")
      expect(page).to_not have_content(review.body)
    end
  end
end
