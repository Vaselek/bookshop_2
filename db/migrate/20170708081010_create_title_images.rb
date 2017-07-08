class CreateTitleImages < ActiveRecord::Migration[5.0]
  def change
    create_table :title_images do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.string :file
      t.string :title

      t.timestamps
    end
  end
end
