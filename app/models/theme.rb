class Theme < ApplicationRecord
  belongs_to :category
  belongs_to :book
end
