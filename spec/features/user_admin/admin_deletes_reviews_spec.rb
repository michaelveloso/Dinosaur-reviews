require 'rails_helper'

feature 'admin can delete reviews', %{
  As an administrator
  I want to delete reviews
  So that I can keep my site friendly

  Acceptance criteria
  [] - Admin sees delete review button on dinosaur show page
  [] - After successful deletion, admin is redirected to dinosaur
  [] - After successful deletion, admin is notified
} do

  before(:each) do
    user = FactoryGirl.create(:user_admin)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    @review = FactoryGirl.create(:review)
    visit dinosaur_path(@review.dinosaur)
  end

  scenario "Admin sees delete review button on show page" do
    find_button "Delete"
  end

  scenario "After successful deletion, admin stays on dinosaur show page" do
    click_button "Delete"

    expect(current_path).to eq(dinosaur_path(@review.dinosaur))
  end

  scenario "After successful deletion, admin is notified" do
    click_button "Delete"

    expect(page).to have_content("Review deleted!")
  end

  scenario "Review does not show up in dinosaur show page after deletion" do
    click_button "Delete"

    expect(page).to_not have_content(@review.body)
  end

  scenario "Review is no longer in database after deletion" do
    expect(@review).to eq(Review.last)
    click_button "Delete"

    expect(@review).to_not eq(Review.last)
  end

end
