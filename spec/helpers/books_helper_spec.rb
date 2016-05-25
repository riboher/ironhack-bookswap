require 'rails_helper'
RSpec.describe BooksHelper, type: :helper do

  let(:reader){build(:reader, credit: 35)}
  let(:book){build(:book)}

  describe 'Owner name formatting' do
    it "returns the user's first name if no last name is provided" do
      reader.last_name = nil
      expect(format_owner_name(reader.first_name,reader.last_name)).to eq(reader.first_name)
    end

    it "combines the first name and the first letter of the last name if it is provided" do
      expect(format_owner_name(reader.first_name,reader.last_name)).to eq(reader.first_name+reader.last_name[0])
    end
  end

  describe 'compare credit' do
    it "returns false if the user's current credit is bigger than the price of the book" do
     book.price = 15
      expect(compare_credit(book.price,reader.credit)).to be false
    end

    it "returns true if the book's price is higher than the user's credit" do
      reader.credit = 15
      book.price = 45
      expect(compare_credit(book.price,reader.credit)).to be true
    end
  end

  describe 'check avatar' do
    it 'shows the book cover if no avatar file name is found' do
      book.avatar_file_name = nil
      expect(check_avatar(book)).to eq(book.cover)
    end

    it 'shows the avatar if there is one' do
      book.avatar_file_name = 'some_image.png'
      expect(check_avatar(book)).to eq(book.avatar)
    end
  end
end
