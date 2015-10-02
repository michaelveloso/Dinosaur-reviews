# require 'rails_helper'
#
# feature 'user adds new review', %{
#   As a user
#   I want to receive emails when people review my dinosaur
#   So that I know what people think of my dinosaur
#
#   Acceptance Criteria
#   [] User receives email on new review
#   [] Email is sent to correct address
#   [] Email contains reviewer's email
#   [] Email contains review body
#   [] Email contains dinosaur information
#
# } do
#
#   before(:each) do
#     @dinosaur = FactoryGirl.create(:dinosaur)
#     @reviewer = FactoryGirl.create(:user)
#     visit new_user_session_path
#
#     fill_in 'Email', with: @reviewer.email
#     fill_in 'Password', with: @reviewer.password
#     click_button 'Log in'
#     visit dinosaur_path(@dinosaur)
#
#     fill_in("textarea-review", with: "What a nice dinosaur!")
#     select '2', from: 'Rating'
#     click_button("Submit")
#
#     @email = ActionMailer::Base.deliveries.last
#   end
#
#   scenario "Email is sent when new review is posted" do
#     expect(ActionMailer::Base.deliveries.count).to eq(1)
#   end
#
#   scenario "Email is sent to correct address" do
#     expect(@email.body.raw_source).to have_content(@dinosaur.user.email)
#   end
#
#   scenario "Email contains reviewer's email" do
#     expect(@email.body.raw_source).to have_content(@reviewer.email)
#   end
#
#   scenario "Email contains review body" do
#     expect(@email.body.raw_source).to have_content("What a nice dinosaur!")
#   end
#
#   scenario "Email contains dinosaur information" do
#     expect(@email.body.raw_source).to have_content(@dinosaur.name)
#   end
# end
