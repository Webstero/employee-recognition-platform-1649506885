FactoryBot.define do
  factory :order do
    reward
    employee
    bought_reward { reward }
  end
end
