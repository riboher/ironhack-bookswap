class AddIsAvailableToBooks < ActiveRecord::Migration
  def change
    add_column :books, :is_available, :boolean, default: true
  end
end
