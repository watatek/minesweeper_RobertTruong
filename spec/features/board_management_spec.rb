require 'rails_helper'

RSpec.feature "Board Management", type: :feature do
  scenario "User creates a new board" do
    visit new_board_path

    fill_in "Email", with: "test@example.com"
    fill_in "Board name", with: "Test Board"
    fill_in "Width", with: 5
    fill_in "Height", with: 5
    fill_in "Mines", with: 3

    click_button "Generate Board"

    expect(page).to have_content("Test Board")
    expect(page).to have_content("test@example.com")
  end
end
