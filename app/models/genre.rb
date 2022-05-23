class Genre < ApplicationRecord
  has_many :books, dependent: :destroy

 def self.looks(search, word)
    if search == "perfect_match"
      where(name: word)
    elsif search == "forward_match"
     where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
     where("name LIKE?", "%#{word}")
    elsif search == "pertial_match"
     where("name LIKE?", "%#{word}%")
    else
     all
    end
 end
end
