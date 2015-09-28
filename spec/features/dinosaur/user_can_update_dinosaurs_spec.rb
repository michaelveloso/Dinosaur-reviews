require 'rails_helper'

feature 'user can update a dinosaur', %{
  As a user
  I want to update a dinosaur
  So that I can keep it up to date

  Acceptance Criteria
  [√] - Dinosaur show page should have a link to edit page
  [√] - Form should be displayed correctly
  [√] - Form fields are filled in with current dinosaur's values
  [√] - Edit page has link to show page
  [√] - Edit page has link to index
  [√] - User gets confirmation upon correct update
  [√] - User is taken to show page on correct update
  [√] - User gets errors on incorrect update
  [√] - User stays on edit page if there are errors

} do

  context "User is not original creator" do
    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    scenario "User can't update dinosaur" do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit dinosaur_path(dinosaur)

      expect(page).to_not have_content("Change this Dinosaur!")
    end

    scenario "User can't manually visit edit page" do
      dinosaur = FactoryGirl.create(:dinosaur)
      visit edit_dinosaur_path(dinosaur)

      expect(current_path).to_not eq(edit_dinosaur_path(dinosaur))
      expect(current_path).to eq(dinosaur_path(dinosaur))
      expect(page).to have_content("You can't edit this dinosaur!")
    end
  end

  feature "User can update dinosaurs if signed in and orginally created it" do

    before(:each) do
      user = FactoryGirl.create(:user)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      @dinosaur = FactoryGirl.create(:dinosaur, user: user)
      visit dinosaur_path(@dinosaur)
    end

    scenario 'show page should have a link to edit page' do
      click_button 'Edit this dinosaur!'
      expect(page).to have_content("Change this Dinosaur!")
    end

    scenario 'form should be displayed correctly' do
      visit edit_dinosaur_path(@dinosaur)

      find_field("Name")
      find_field("Location found")
      find_field("Info url")
      find_field("Description")
    end

    scenario 'form is pre-filled with current values' do
      visit edit_dinosaur_path(@dinosaur)

      find_field('Name').value.should eq(@dinosaur.name)
      find_field('Location found').value.should eq(@dinosaur.location_found)
      find_field('Info url').value.should eq(@dinosaur.info_url)
      find_field('Description').value.should eq(@dinosaur.description)
    end

    scenario 'edit page has link to show page' do
      visit edit_dinosaur_path(@dinosaur)

      click_button "Back to #{@dinosaur.name}!"

      expect(current_path).to eq(dinosaur_path(@dinosaur))
    end

    scenario 'edit page has link to index' do
      visit edit_dinosaur_path(@dinosaur)

      click_button "Back to home"

      expect(current_path).to eq(dinosaurs_path)
    end

    feature 'user enters information correctly' do

      scenario 'user gets confirmation of update' do
        visit edit_dinosaur_path(@dinosaur)

        fill_in "Name", with: "New Name"
        fill_in "Location found", with: "Idaho"
        fill_in "Info url", with: "www.example.com"
        fill_in "Description", with: "new description"

        click_button "Change this dinosaur!"

        expect(page).to have_content("Dinosaur changed!")
      end

      scenario 'user is taken to show page' do
        visit edit_dinosaur_path(@dinosaur)

        fill_in "Name", with: "New Name"
        fill_in "Location found", with: "Idaho"
        fill_in "Info url", with: "www.example.com"
        fill_in "Description", with: "new description"
        click_button "Change this dinosaur!"

        expect(current_path).to eq(dinosaur_path(@dinosaur))
        expect(page).to have_content("New Name")
        expect(page).to have_content("Idaho")
        expect(page).to have_content("new description")
      end

    end

    feature 'user enters information incorrectly' do

      scenario 'user gets errors' do
        visit edit_dinosaur_path(@dinosaur)

        fill_in "Name", with: ""
        fill_in "Location found", with: ""
        fill_in "Info url", with: ""
        fill_in "Description", with: ""
        click_button "Change this dinosaur!"

        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Location found can't be blank")
        expect(page).to have_content("Info url can't be blank")
        expect(page).to have_content("Description can't be blank")
      end

      scenario 'user stays on page' do
        visit edit_dinosaur_path(@dinosaur)

        fill_in "Name", with: ""
        fill_in "Location found", with: ""
        fill_in "Info url", with: ""
        fill_in "Description", with: ""
        click_button "Change this dinosaur!"

        find_field("Name")
        find_field("Location found")
        find_field("Info url")
        find_field("Description")
      end
    end
  end
end
