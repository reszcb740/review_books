class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :book

  validates :customer_id, uniqueness: { scope: :book_id }
end
