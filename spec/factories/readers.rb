FactoryGirl.define do
  factory :reader do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    address { Faker::Address.street_name }
    city { Faker::Address.city }
    postcode { Faker::Address.postcode }
    email { |reader| Faker::Internet.email(reader.first_name) }
    password {Faker::Internet.password(8)}
  end
end
