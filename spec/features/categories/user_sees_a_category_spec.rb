require 'rails_helper'

describe "User sees a category" do
  scenario "a user sees a category" do
    category = create(:category, :with_jobs, job_count: 2)
    job1, job2 = category.jobs

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content(category.name)
    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)

  end
end
