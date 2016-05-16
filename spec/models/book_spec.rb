require 'rails_helper'

RSpec.describe Book, type: :model do
  describe '#get_available_books' do
    it 'retrieves all books but the ones from the current user' do
      user = create(:reader, id: 1)
      book1 = create(:book, reader_id: 2)
      book2 = create(:book, reader_id: 2)
      book3 = create(:book, reader_id: 2)
      book4 = create(:book, reader_id: 1, title: "Post Office")
      expect(Book.get_available_books(user).length).to eq(3)
    end
  end
end
