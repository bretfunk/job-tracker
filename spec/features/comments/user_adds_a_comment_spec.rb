require 'rails_helper'

describe "User can add a comment" do
  scenario "a user can add a comment on the job page" do
    company = create(:company, :with_jobs, job_count: 2)
    job1, job2 = company.jobs

    visit companies_path

    click_on company.name

    expect(page).to have_content company.jobs.first.title
    expect(page).to have_content company.jobs.last.title

    within(".job_#{job1.id}") do
      click_link "Profile"
    end

    expect(page).to have_content job1.title
    expect(page).to have_content job1.description
    expect(page).to have_content job1.level_of_interest
    expect(page).to have_content job1.city
    expect(page).to have_content job1.category.name
    expect(page).to have_content job1.company.name
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
    expect(page).to have_link "Create a New Category"
    expect(page).to have_link "Back to All Jobs"
    expect(page).to have_content "Post a Comment"

    fill_in "comment[author]", with: "Elon"
    fill_in "comment[body]", with: "Would make good Astronaut"
    click_on "Submit"

    visit company_job_path(company, job1)

    expect(page).to have_content "Comment by Elon"
    expect(page).to have_content "Would make good Astronaut"

  end
end
