require 'rails_helper'
require 'support/request_helpers'
require 'pry'

RSpec.describe BooksController, type: :controller do
  # include RequestHelpers
  # describe 'GET #all' do
  #   render_views
  #   it 'should display all books but the ones from the user itself' do
  #     @request.env['devise.mapping'] = Devise.mappings[:reader]
  #     logged_user = create_logged_in_user
  #     current_reader = logged_user
  #     user = create(:reader, id: 2)
  #     book1 = create(:book, reader_id: 2)
  #     book2 = create(:book, reader_id: 2)
  #     book3 = create(:book, reader_id: 2)
  #     book4 = create(:book, reader_id: 1, title: "Post Office")
  #     get 'index'
  #     expect(response.body).to_not include(book4.title)
  #   end
  # end
end
