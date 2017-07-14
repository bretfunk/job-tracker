require 'rails_helper'
describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company, name: "ESPN")
    job = company.jobs.create!(title: "Pilot", level_of_interest: 70, city: "Denver")

    visit company_job_path(company, job)

    expect(page).to have_content(company.name)
    expect(page).to have_content("Pilot")
    expect(page).to have_content("70")

    click_link "Delete"

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to_not have_content("Pilot")

  end
end
