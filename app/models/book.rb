class Book < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  belongs_to :reader
  has_many :transactions
  validates :title, presence: true
  validates :isbn, presence: true, length: { in: 10..13 }
  validates :author, presence: true

  def self.get_available_books(current_reader)
    if current_reader != nil
      all.where.not(reader_id: current_reader.id).where(is_available: true).order(created_at: :desc)
    else
      all.where(is_available: true).order(created_at: :desc)
    end
  end

  def self.get_books_from(reader)
    where(reader_id: reader.id).where(is_available: true).order(created_at: :desc)
  end

  def has_ownership?(owner)
    self.reader_id == owner.id
  end

  def change_ownership(reader)
    self.update_attribute(:reader_id, reader.id)
  end

  def self.get_book_by_title(keyword)
    find_by(title: keyword)
  end
end
