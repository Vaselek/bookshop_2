class CreateThemes < ActiveRecord::Migration[5.0]
  def change
    create_table :themes do |t|
      t.references :category, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
