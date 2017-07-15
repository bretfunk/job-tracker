require 'rails_helper'

describe "User sees all categories" do
  scenario "A user sees all categories" do
    category1 = create(:category)
    category2 = create(:category)
    category3 = create(:category)

    visit categories_path

    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)
    expect(page).to have_content(category3.name)
  end
end
