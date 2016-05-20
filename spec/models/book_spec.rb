require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#get_available_books' do
    it 'retrieves all available books but the ones from the current user' do
      current_user = create(:reader, id: 1)
      book1 = create(:book, reader_id: 2)
      book2 = create(:book, reader_id: 2, is_available: false)
      book3 = create(:book, reader_id: 2)
      book4 = create(:book, reader_id: 1, title: "Post Office")
      expect(Book.get_available_books(current_user).length).to eq(2)
    end

    it 'retrieves all available books if no user is logged in' do
      current_user = nil
      book1 = create(:book, reader_id: 2)
      book2 = create(:book, reader_id: 2, is_available: false)
      book3 = create(:book, reader_id: 2)
      book4 = create(:book, reader_id: 1, title: "Post Office")
      expect(Book.get_available_books(current_user).length).to eq(3)
    end
  end

  describe '#get_books_from_user' do
    it 'retrieves all available books from a specific user' do
      current_reader = create(:reader, id: 5)
      create(:book,reader_id: 5)
      create(:book,reader_id: 5, is_available: false)
      create(:book,reader_id: 5)
      create(:book,reader_id: 2)
      expect(Book.get_books_from(current_reader).length).to eq(2)
    end
  end

  describe '#check_ownership' do
    it 'makes sure that a book belongs to a certain owner' do
      book = create(:book, reader_id: 3)
      expect(book.has_ownership?(build(:reader, id: 3))).to be true
    end
  end

  describe '#change_ownership' do
    it 'changes the ownership of a book' do
      book = create(:book, reader_id: 3)
      book.change_ownership(build(:reader, id: 16))
      expect(book.reader_id).to eq(16)
    end
  end

  describe '#get_book_by_title' do
    it 'should retrieve a single book if found' do
      book = create(:book)
      keyword = book.title
      expect(Book.get_book_by_title(keyword)).to eq(book)
    end
  end
end
