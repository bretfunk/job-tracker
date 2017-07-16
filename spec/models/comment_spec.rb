require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without an author" do
        job = create(:job)
        comment = job.comments.create(body: "blah blah")

        expect(comment).to be_invalid
      end

      it "is invalid without a body" do
        job = create(:job)
        comment = job.comments.create(author: "Taleb")

        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with an author, body, and job" do
        comment = create(:comment)

        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a job" do
      comment = create(:comment)

      expect(comment).to respond_to(:job)
    end
  end
end
