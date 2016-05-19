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
    expect(build(:reader,avatar_file_name: nil)).to be_valid
  end

  it 'has a unique email' do
    create(:reader, email: 'riboher@gmail.com')
    expect(build(:reader,email: 'riboher@gmail.com')).to_not be_valid
  end

  it 'has 15 credits when creating an account' do
    expect(build(:reader).credit).to eq(15)
  end

  describe '#has_credit?' do
    it 'returns true when the reader has credit enough' do
      reader = create(:reader, credit: 18)
      book = create(:book, price: 15)
      expect(reader.has_credit?(book)).to eq true
    end
  end
end
