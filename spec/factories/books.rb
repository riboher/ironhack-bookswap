FactoryGirl.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    year { Date.today.year - rand(100) }
    isbn { Faker::Code.ean }
    cover { Faker::Placeholdit.image("380x550") }
    price { Faker::Commerce.price }
    publisher { Faker::Book.publisher }
    association :reader
  end
end
