FactoryBot.define do
  factory :order do
    reward
    employee
    price { reward.price }
  end
end
