require "rails_helper"

feature "user can see their own team", %{
  As a user,
  I want to see my average damage to champions
  so that I can see how I am contributing
} do
  scenario "user visits damage to champions", js: true, vcr: true do
    visit "/"
    fill_in "summoner_name", with: "thememan"
    click_button "Search"
    click_link "Hello Kitties On Crack"
    click_link "Damages"
    expect(page).to have_content "QuidEstPro"
    expect(page).to have_content "Average Percent Damage Dealt to Champions"
  end
end
