FactoryBot.define do
  factory :order do
    reward { association :reward }
    employee { association :employee }
  end
end
