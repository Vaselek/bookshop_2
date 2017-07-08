class Book < ApplicationRecord
  belongs_to :user
  has_many :authorships
  has_many :authors, through: :authorships
  has_many :themes
  has_many :categories, through: :themes
  has_many :rates

  validates :authors, :presence => true
  validates :categories, :presence => true
  validates :file, :presence => true

  mount_uploader :file, FileUploader
  self.per_page = 9

  def average_rating
    rates.average(:value) || "0"
  end

end
