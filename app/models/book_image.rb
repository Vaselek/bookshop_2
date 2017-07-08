class BookImage < ApplicationRecord
  belongs_to :user
  belongs_to :book

  mount_uploader :file, BookImageUploader
  self.per_page = 9
end
