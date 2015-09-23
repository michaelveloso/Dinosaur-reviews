require 'rails_helper'

feature 'user can add a comment to a review', %{
  As a user
  I want to add a comment to a review
  So others can hear my opinions

  Acceptance Criteria
  [] - User must be signed in
  [] - Form should be displayed correctly
  [] - User can submit a comment
  [] - User can't leave form blank
  [] - User can see their comment on the show page


} do

  feature "User can add comment if signed in" do

    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario 'User fills in form correctly' do
      review = FactoryGirl.create(:review)
      visit dinosaur_path(review.dinosaur)

      fill_in 'Comment', with: "This review is awesome!"
      click_button 'Save comment'
      expect(page).to have_content("This review is awesome!")
    end

    scenario 'form should be displayed correctly' do
      review = FactoryGirl.create(:review)
      visit dinosaur_path(review.dinosaur)

      click_button 'Save comment'

      find_field("Body")
    end

    scenario 'form is filled out incorrectly' do
      review = FactoryGirl.create(:review)
      visit dinosaur_path(review.dinosaur)

      click_button 'Save comment'

      expect(page).to have_content("can't be blank")
    end
  end

  feature 'User has not signed in' do

    scenario "User can't comment on a review" do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit dinosaur_path(dinosaur)

      expect(page).to_not have_content('Add Comment')
    end
  end
end
