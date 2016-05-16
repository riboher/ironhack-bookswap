class Book < ActiveRecord::Base
  belongs_to :reader

  def self.get_available_books(current_reader)
    all.where.not(reader_id: current_reader.id).where(is_available: true)
  end
end
