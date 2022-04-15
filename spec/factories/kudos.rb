FactoryBot.define do
  factory :kudo do
    title { 'Factory test' }
    content { 'Content of factory test' }
    giver { association :employee }
    receiver { association :employee }
  end
end
