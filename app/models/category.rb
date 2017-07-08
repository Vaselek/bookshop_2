class Category < ApplicationRecord
  has_many :themes
  has_many :books, through: :themes
end
