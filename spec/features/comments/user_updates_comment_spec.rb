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

  feature "user is signed in but not the owner" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      @comment = FactoryGirl.create(:comment)
    end

    scenario "user cannot see update comment button" do
      visit dinosaur_path(@comment.review.dinosaur)
      expect(page.has_no_button?("Update comment")).to eq(true)
    end

    scenario "user cannot manually visit path of a comment they don't own" do
      visit edit_review_comment_path(review_id: @comment.review, id: @comment)
      expect(current_path).to eq(dinosaur_path(@comment.review.dinosaur))
      expect(page).to have_content("You can't edit this comment!")
    end
  end
  feature "User is signed in and is the owner" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      @comment = FactoryGirl.create(:comment, user: user)
      visit dinosaur_path(@comment.review.dinosaur)
    end

    scenario "visit details page, sees comment-update button" do
      expect(page).to have_button("Update comment")
    end

    scenario "User fills out form correctly" do
      click_button("Update comment")

      fill_in("Comment", with: "Howdy Partner!")
      click_button("Update comment")

      expect(page).to have_content("Howdy Partner!")
    end

    scenario "User fills out form incorrectly" do
      click_button("Update comment")
      fill_in("Comment", with: nil)
      click_button("Update comment")

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
