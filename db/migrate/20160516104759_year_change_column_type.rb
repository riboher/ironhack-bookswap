class YearChangeColumnType < ActiveRecord::Migration
  def change
    change_column :books, :year, :string
  end
end
