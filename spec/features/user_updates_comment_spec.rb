require 'rails_helper'

feature 'user updates comment', %{
  As a user
  I want to update my comment
  So that I can change my mind

  Acceptance Criteria
  [] User sees update button
  [] User must fill out form correctly
  [] User will see updated comment on dino page if correctly filled out
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

    scenario "visit details page, sees comment-update button" do
      comment = FactoryGirl.create(:comment)

      visit dinosaur_path(comment.review.dinosaur)
      expect(page).to have_button("Update comment")
    end

    scenario "User fills out form correctly" do
      comment = FactoryGirl.create(:comment)

      visit dinosaur_path(comment.review.dinosaur)

      fill_in("Body", with: comment.body)
      click_link("Update comment")

      expect(page).to have_content("Comment Updated!")
    end

    scenario "User fills out form incorrectly" do
      comment = FactoryGirl.create(:comment)

      visit dinosaur_path(comment.review.dinosaur)

      click_link("Update comment")

      expect(page).to have_content("can't be blank")
    end
  end

  feature "user is not logged in" do
    scenario "user does not see link to update comments" do
      comment = FactoryGirl.create(:comment)

      visit dinosaur_path(comment.review.dinosaur)

      expect(page).to_not have_content("Update comment")
    end
  end
end
