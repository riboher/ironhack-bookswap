class Book < ActiveRecord::Base
  belongs_to :reader

  def self.get_available_books(current_reader)
    if current_reader != nil
      all.where.not(reader_id: current_reader.id).where(is_available: true)
    else
      all
    end
  end
end
