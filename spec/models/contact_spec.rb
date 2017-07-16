require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid without all attributes" do
    it "is invalid without a fname" do
      company = create(:company)
      contact = company.contacts.create(lname: "Musk", position: "CEO", email: "elon@spacex.com")

      expect(contact).to be_invalid
      end

    it "is invalid without a lname" do
      company = create(:company)
      contact = company.contacts.create(fname: "Elon", position: "CEO", email: "elon@spacex.com")

      expect(contact).to be_invalid
      end

    it "is invalid without a position" do
      company = create(:company)
      contact = company.contacts.create(fname: "Elon", lname: "Musk", email: "elon@spacex.com")

      expect(contact).to be_invalid
    end

    it "is invalid without an email" do
      company = create(:company)
      contact = company.contacts.create(fname: "Elon", lname: "Musk", position: "CEO")

      expect(contact).to be_invalid
      end
    end
    context "is valid with valid attributes" do
      it "is valid with valid attributes" do
      contact = create(:contact)

      expect(contact).to be_valid
      end
    end
    describe "relationships" do
        it "belongs to a company" do
          contact = create(:contact)

          expect(contact).to respond_to(:company)
      end
    end
  end
end
