require 'rails_helper'

RSpec.describe Reader, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    expect(build(:reader)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:reader,first_name: nil)).to_not be_valid
  end

  it 'is invalid without a postcode' do
    expect(build(:reader, postcode: nil)).to_not be_valid
  end

  it 'is invalid without an email' do
    expect(build(:reader, email: nil)).to_not be_valid
  end

  it 'is valid without an address' do
    expect(build(:reader, address: nil)).to be_valid
  end

  it 'has an avatar, wether it is provided by the user or not' do
    expect(build(:reader,avatar_file_name: nil)).to_not be_valid
  end

  it 'has a unique email' do
    create(:reader, email: 'riboher@gmail.com')
    expect(build(:reader,email: 'riboher@gmail.com')).to_not be_valid
  end

  it 'has 15 credits when creating an account' do
    expect(build(:reader).credit).to eq(15)
  end

  pending 'reduces its credit by the value of the book' do
    buyer = create(:reader, credit: 45)
    seller = create(:reader, credit: 70)
    book = create(:book, price: 20, reader_id: seller.id)
    buyer.swap_book(book)
    expect(buyer.credit).to eq(25)
  end
end
