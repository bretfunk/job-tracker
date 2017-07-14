FactoryGirl.define do
  factory :company do
    sequence :name do |i|
      "Company#{i}"
    end
  end
end
