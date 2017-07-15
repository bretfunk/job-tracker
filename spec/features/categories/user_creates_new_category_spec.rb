require 'rails_helper'

describe "User creates new category" do
  scenario "a user can create a new company" do
    visit new_category_path

    fill_in "category[name]", with: "Space Exploration"

    click_on "Create Category"

    visit categories_path

    expect(page).to have_content("Space Exploration")
    expect(Category.count).to eq(1)

    visit new_category_path

    fill_in "category[name]", with: "Space Exploration"

    click_on "Create Category"

    visit categories_path

    expect(page).to have_content("Space Exploration")
    expect(Category.count).to eq(1)
    end
  end
