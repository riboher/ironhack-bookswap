require 'rails_helper'

feature 'book creation from ISBN', :js => true do
  scenario 'AJAX call to public API to retrieve a book' do
    visit all_path
    click_button('Add new book')
    fill_in 'search-isbn', :with => '9781844137879'
    click_on 'submit'
  end
end
