class BookComment < ApplicationRecord
  belongs_to :book
  belongs_to :customer

  validates :comment, presence: true
end
