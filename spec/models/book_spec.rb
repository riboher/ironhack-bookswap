require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#get_available_books' do
    it 'retrieves all books but the ones from the current user' do
      current_user = create(:reader, id: 1)
      book1 = create(:book, reader_id: 2)
      book2 = create(:book, reader_id: 2)
      book3 = create(:book, reader_id: 2)
      book4 = create(:book, reader_id: 1, title: "Post Office")
      expect(Book.get_available_books(current_user).length).to eq(3)
    end

    it 'retrieves all books if no user is logged in' do
      current_user = nil
      book1 = create(:book, reader_id: 2)
      book2 = create(:book, reader_id: 2)
      book3 = create(:book, reader_id: 2)
      book4 = create(:book, reader_id: 1, title: "Post Office")
      expect(Book.get_available_books(current_user).length).to eq(4)
    end
  end

  describe '#get_books_from_user' do
    it 'retrieves all the books from a specific user' do
      current_reader = create(:reader, id: 5)
      create(:book,reader_id: 5)
      create(:book,reader_id: 5)
      create(:book,reader_id: 5)
      create(:book,reader_id: 2)
      expect(Book.check_books_from(current_reader).length).to eq(3)
    end
  end
end
