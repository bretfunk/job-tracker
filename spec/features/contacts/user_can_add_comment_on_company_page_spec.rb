require 'rails_helper'

describe "User can leave a comment" do
  scenario "A user leaves a comment" do

company = create(:company, :with_jobs, job_count: 1)
contact = company.contacts.create(fname: "Elon", lname: "Musk", position: "CEO", email: "elon@spacex.com")

visit company_path(company)

expect(page).to have_content(contact.fname)
expect(page).to have_content(contact.lname)
expect(page).to have_content(contact.position)
expect(page).to have_content(contact.email)

expect(page).to have_content("Add a Contact")

fill_in "contact[fname]", with: "Jeff"
fill_in "contact[lname]", with: "Bezos"
fill_in "contact[position]", with: "CEO"
fill_in "contact[email]", with: "jeff@amazon.com"
click_on "Submit Contact"

visit company_path(company)

expect(page).to have_content(contact.fname)
expect(page).to have_content(contact.lname)
expect(page).to have_content(contact.position)
expect(page).to have_content(contact.email)

expect(page).to have_content("Jeff")
expect(page).to have_content("Bezos")
expect(page).to have_content("CEO")
expect(page).to have_content("jeff@amazon.com")

  end
end
