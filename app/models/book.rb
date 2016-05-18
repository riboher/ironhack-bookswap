class Book < ActiveRecord::Base
  belongs_to :reader
  validates :title, presence: true
  validates :isbn, length: { in: 10..13 }
  validates :author, presence: true

  def self.get_available_books(current_reader)
    if current_reader != nil
      all.where.not(reader_id: current_reader.id).where(is_available: true)
    else
      all
    end
  end

  def self.get_books_from(reader)
    where(reader_id: reader.id)
  end
end
