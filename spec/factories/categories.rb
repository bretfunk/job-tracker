FactoryGirl.define do
  factory :category do
    sequence :name do |i|
      "Category #{i}"
    end

    trait :with_jobs do
      transient do
        job_count 3
      end

      after(:create) do |category, evaluator|
        category.jobs << create_list(:name, evaluator.job_count)
      end
    end
  end
end
