FactoryGirl.define do
  factory :job do
    sequence :title do |i|
      "Title#{i}"
    end

  description "Sweet.  There is an expresso machine"

  sequence :level_of_interest do |i|
      i
    end
  sequence :city do |i|
    "City#{i}"
    end
    company
    category
  end
  trait :with_comments do
transient do
  comment_count 3
end

after(:create) do |job, evaluator|
  job.comments << create_list(:comment, evaluator.comment_count)
    end
  end
end
