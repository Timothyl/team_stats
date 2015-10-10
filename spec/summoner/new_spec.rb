require "rails_helper"

feature "user can find their own teams", %{
  As a user,
  I want to type in my summoner name and find all my ranked teams,
  so that I can analyze each team
} do

  scenario "user types in their summoner name", vcr: true do
    visit "/"
    fill_in "summoner_name", with: "thememan"
    click_button "Search"
    expect(page).to have_content "Hello Kitties On Crack"
  end

  scenario "user types in a bad summoner name" do
    visit "/"
    fill_in "summoner_name", with: ",,';,',.."
    click_button "Search"
    expect(page).to have_content "Didn't recognize that summoner"
  end

  scenario "user types in a summoner that has no teams", vcr: true do
    visit "/"
    fill_in "summoner_name", with: "xpecial"
    click_button "Search"
    expect(page).to have_content "No teams found for that summoner"
  end
end
