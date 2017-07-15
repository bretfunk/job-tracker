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
end
