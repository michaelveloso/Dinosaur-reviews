require 'rails_helper'

feature 'user deletes review', %{
  As a user
  I want to delete reviews
  So that I can change my mind

  Acceptance Criteria
  [] User can only delete own reviews
  [] User deletes review
  [] User doesn't see review after it's deleted

} do

  feature "User does not own review" do

    before(:each) do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
    end

    scenario "User cannot see delete button" do
      review = FactoryGirl.create(:review)
      visit dinosaur_path(review.dinosaur)

      expect(page.has_no_button?('Delete')).to eq(true)
    end
  end

  feature "User is signed in" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'

      @review = FactoryGirl.create(:review, user: @user)
    end

    scenario "visit show page, clicks delete button" do
      visit dinosaur_path(@review.dinosaur)
      click_button "Delete"
      expect(page).to have_content("Review deleted!")
      expect(page).to_not have_content(@review.body)
    end
  end
end
