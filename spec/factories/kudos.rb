FactoryBot.define do
  factory :kudo do
    title { 'Factory test' }
    content { 'Content of factory test' }
    giver { association :employee }
    receiver { association :employee }
    company_value { association :company_value }
  end
end
