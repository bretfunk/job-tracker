require 'rails_helper'

RSpec.describe "user edits a job" do
  scenario "when visiting the job page" do
    company = create(:company)
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Developer")
    expect(page).to have_content("70")

    click_link "Edit"

    fill_in "job[title]", with: "Press Secretary"

    click_button "Update Job"

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Press Secretary")
    expect(page).to have_content("70")




  end
end
