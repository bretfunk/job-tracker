require 'rails_helper'
describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company, :with_jobs, job_count: 2)
    job1, job2 = company.jobs

    visit company_job_path(company, job1)

    expect(page).to have_content(company.name)
    expect(page).to have_content(job1.title)

    click_link "Delete"

    visit company_path(company)

    expect(page).to_not have_content(job1.title)
    expect(page).to have_content(job2.title)

  end
end
