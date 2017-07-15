require 'rails_helper'

describe "User deletes a category" do
  scenario "a user deletes a category" do

    category1 = create(:category)
    category2 = create(:category)

    visit categories_path

    expect(page).to have_content(category1.name)
    expect(page).to have_content(category2.name)

    click_on "Delete"

    visit categories_path

    expect(page).to have_content(category1.name)
    expect(page).to_not have_content(category2.name)
    expect(Category.count).to eq(1)
  end
end
