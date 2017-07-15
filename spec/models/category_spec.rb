require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
    it "is invalid without a name" do
      category = Category.new()

      expect(category).to be_invalid
      end
    end
  context "is valid with valid attributes" do
    it "has valid attributes" do
    category = create(:category)

    expect(category).to be_valid
      end
    end
  end

  describe "associations" do
    it "has many jobs" do
      category = create(:category)

      expect(category).to respond_to(:jobs)
    end
  end
end
