class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.datetime :year
      t.string :isbn
      t.string :cover
      t.integer :price
      t.string :publisher
      t.integer :reader_id

      t.timestamps null: false
    end
  end
end
