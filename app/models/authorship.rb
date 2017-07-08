class Authorship < ApplicationRecord
  belongs_to :author
  belongs_to :book

  validates :author, :presence => true
  validates :book, :presence => true
end
