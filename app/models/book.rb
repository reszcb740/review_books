class Book < ApplicationRecord
  has_one_attached :profile_image
  belongs_to :customer
  belongs_to :genre

  has_many :book_comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
  validates :customer_id, presence: true
  validates :genre_id, presence: true
  validates :star, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0}, presence: true

    def get_profile_image(width, height)
        unless profile_image.attached?
         file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
         profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        profile_image.variant(resize_to_limit: [width, height]).processed
    end
end
