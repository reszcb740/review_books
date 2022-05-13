class Book < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
end
