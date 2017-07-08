class BookImage < ApplicationRecord
  belongs_to :user
  belongs_to :book

  mount_uploader :file, FileUploader
  self.per_page = 9
end
