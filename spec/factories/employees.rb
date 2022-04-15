FactoryBot.define do
  factory :employee do
    sequence :email do |n|
      "emlpoyee#{n}@testfactory.com"
    end
    password { 'password' }
  end
end
