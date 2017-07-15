require 'rails_helper'

RSpec.describe "user edits a job" do
  scenario "when visiting the job page" do
    company = create(:company, :with_jobs, job_count: 1)
    job = company.jobs.last

    visit company_path(company)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.level_of_interest)

    click_link "Edit"

    fill_in "job[title]", with: "Press Secretary"

    click_button "Update Job"

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Press Secretary")
    expect(page).to have_content(job.level_of_interest)
  end
end
