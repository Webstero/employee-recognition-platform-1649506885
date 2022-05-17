FactoryBot.define do
  factory :company_value do
    sequence :title do |n|
      "title #{n} test"
    end
  end
end
