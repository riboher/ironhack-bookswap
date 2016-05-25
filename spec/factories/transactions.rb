FactoryGirl.define do
  factory :transaction do
    book_id Faker::Number.between(1, 10)
    buyer_id Faker::Number.between(1, 10)
    seller_id Faker::Number.between(1, 10)
  end
end
