FactoryBot.define do
  factory :admin do
    sequence :email do |n|
      "admin#{n}@testfactory.com"
    end
    password { 'password' }
  end
end
