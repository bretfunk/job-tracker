require 'rails_helper'

describe "User edits a category" do
  scenario "A user edits a category" do
    category = create(:category)

    visit categories_path

    click_on "Edit"

    fill_in "category[name]", with: "Space Military"

    click_on "Update Category"

    visit categories_path

    expect(page).to have_content("Space Military")

  end
end
