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
end
