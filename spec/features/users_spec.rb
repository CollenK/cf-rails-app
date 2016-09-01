require "rails_helper"

feature "User management" do
  scenario "admin adds a new user" do
    admin = create(:admin)

    visit root_path
    click_link "Login"
    fill_in "Email", with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    visit root_path
    expect{
      click_link "Users"
      click_link "New User"
      fill_in "First name", with: "Mac"
      fill_in "Last name", with: "Donald"
      fill_in "Email", with: "newuser@example.com"
      fill_in "Password", with: "secret123"
      click_button "Create User"
    }.to change(User, :count).by(1)
    # save_and_open_page
    expect(current_path).to eq users_path
    expect(page).to have_content "User was successfully created"
    within "h1" do
      expect(page).to have_content "All Users"
    end
    expect(page).to have_content "Donald"
  end
end
