FactoryBot.define do
  factory :reward do
    title { 'Factory reward`s` title' }
    description { 'Factory reward`s description' }
    price { Faker::Number.within(range: 1..10) }
  end
end
