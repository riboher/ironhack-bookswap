class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :year
      t.string :isbn
      t.string :cover
      t.integer :price
      t.string :publisher
      t.references :reader, index: true
      t.boolean :is_available, default: true
      t.timestamps null: false
    end
  end
end
