require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:current_reader){create(:reader)}
  let(:book_assigned){create(:book, reader: current_reader)}

  it 'has a valid factory' do
    expect(build(:book)).to be_valid
  end

  it 'is invalid without a title' do
    expect(build(:book, title: nil)).to_not be_valid
  end

  it 'is invalid without an author' do
    expect(build(:book, author: nil)).to_not be_valid
  end

  it 'has an ISBN between 10 and 13 digits' do
    expect(build(:book, isbn: '978635')).to_not be_valid
  end

  describe '#get_available_books' do
    before do
      create_list(:book, 2)
      create(:book, reader: current_reader, is_available: false)
    end

    it 'retrieves all available books but the ones from the current user' do
      expect(Book.get_available_books(current_reader).length).to eq(2)
    end

    it 'retrieves all available books if no user is logged in' do
      expect(Book.get_available_books(nil).length).to eq(2)
    end
  end

  describe '#get_books_from' do
    it 'retrieves all available books from a specific user' do
      create(:book,reader: current_reader, is_available: false)
      create_list(:book, 3, reader: current_reader)
      expect(Book.get_books_from(current_reader).length).to eq(3)
    end
  end

  describe '#has_ownership?' do
    it 'makes sure that a book belongs to a certain owner' do
      expect(book_assigned.has_ownership?(current_reader)).to be true
    end
  end

  describe '#change_ownership' do
    it 'changes the ownership of a book' do
      reader = create(:reader)
      book_assigned.change_ownership(reader)
      expect(book_assigned.reader_id).to eq(reader.id)
    end
  end

  describe '#get_book_by_title' do
    it 'should retrieve a single book if found' do
      keyword = book_assigned.title
      expect(Book.get_book_by_title(keyword)).to eq(book_assigned)
    end
  end
end
