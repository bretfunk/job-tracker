class Contact < ApplicationRecord
  validates :fname, :lname, :position, :email, presence: true
  belongs_to :company
end
