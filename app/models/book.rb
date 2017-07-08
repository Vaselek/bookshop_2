class Book < ApplicationRecord
  belongs_to :user
  has_many :authorships
  has_many :authors, through: :authorships
  has_many :themes
  has_many :categories, through: :themes
  has_many :book_images
end
