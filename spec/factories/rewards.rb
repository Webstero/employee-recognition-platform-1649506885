FactoryBot.define do
  factory :reward do
    title { 'Factory reward`s` title' }
    description { 'Factory reward`s description' }
    price { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
  end
end
