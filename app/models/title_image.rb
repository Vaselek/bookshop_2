class TitleImage < ApplicationRecord
  belongs_to :user
  belongs_to :book

  mount_uploader :file, TitleImageUploader
  self.per_page = 9

end

