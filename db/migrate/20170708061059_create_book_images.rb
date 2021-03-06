class CreateBookImages < ActiveRecord::Migration[5.0]
  def change
    create_table :book_images do |t|
      t.string :title
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
