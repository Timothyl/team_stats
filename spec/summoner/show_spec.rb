require "rails_helper"

feature "user sees damages", %{
  As a user,
  I want to choose a team
  so that I can look the data for each one
} do
  scenario "user chooses damages tab", vcr: true, js: true do
    visit "/"
    visit "/"
    fill_in "summoner_name", with: "thememan"
    click_button "Search"
    click_link "Hello Kitties On Crack"
    expect(page).to have_content "QuidEstPro"
    expect(page).to have_content "Member since: August-20-2015"
  end
end
