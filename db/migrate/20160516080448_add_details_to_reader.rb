class AddDetailsToReader < ActiveRecord::Migration
  def change
    add_column :readers, :first_name, :string
    add_column :readers, :last_name, :string
    add_column :readers, :address, :string
    add_column :readers, :city, :string
    add_column :readers, :postcode, :string
    add_column :readers, :credit, :integer, default: 15
  end
end
