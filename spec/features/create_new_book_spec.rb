require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature 'book creation from ISBN', :js => true do
  skip 'AJAX call to public API to retrieve a book' do
    logout(:reader)
    user = FactoryGirl.create(:reader)
    login_as(user, :scope => :reader)
    visit root_path
    sleep 3
    find('a',text: "Nuevo libro").click
    sleep 3
    within('.new-book') do
      fill_in 'isbn', :with => '9781844137879'
      find('.isbn-submit').click
    end
    sleep 5
    expect(page).to have_content('Avatar')
  end
end
Warden.test_reset!
