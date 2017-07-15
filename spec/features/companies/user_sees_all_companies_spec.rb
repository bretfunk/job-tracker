require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    category1 = create(:category)
    category2 = create(:category)


    visit categories_path

    expect(page).to have_content(category1.name)
    expect(page).to have_content (category2.name)
  end

end
