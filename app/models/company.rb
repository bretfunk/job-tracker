class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def average_level_of_interest
    jobs.average(:level_of_interest).to_i
  end

  def self.sort_by_level_of_interest
    sorted = {}
    company = Company.all.each do |company|
      sorted[company.name] = company.average_level_of_interest
    end
    return sorted.select {|k,v| v > 1}
  end
end
