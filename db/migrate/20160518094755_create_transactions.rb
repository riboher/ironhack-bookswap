class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :book, index: true
      t.timestamps null: false
    end
    add_reference :transactions, :buyer, references: :readers
    add_reference :transactions, :seller, references: :readers
  end
end
