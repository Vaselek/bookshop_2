class Theme < ApplicationRecord
  belongs_to :category
  belongs_to :book

  validates :category, :presence => true
  validates :book, :presence => true
end
