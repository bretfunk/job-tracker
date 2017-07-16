FactoryGirl.define do
  factory :comment do
    sequence :author do |i|
      "Author#{i}"
    end
    sequence :body do |i|
      "Body#{i}"
    end
    job
  end
end
