class AddFileToBookImages < ActiveRecord::Migration[5.0]
  def change
    add_column :book_images, :file, :string
  end
end
