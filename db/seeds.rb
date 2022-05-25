1.upto(5) do |i|
  Employee.create!(email: "employee#{i}@test.com", password: 'password')
end

%w[Honesty Ownership Accountability Passion].each do |company_value_title|
  CompanyValue.create!(title: company_value_title)
end

1.upto(9) do
  kudo = Kudo.create! title: Faker::Name.unique.name, 
    content: Faker::Hacker.say_something_smart, 
    giver: Employee.where("id = ? OR id = ?", Employee.first.id, Employee.second.id).sample, 
    receiver: Employee.where.not("id = ? OR id = ?", Employee.first.id, Employee.second.id).sample, 
    company_value_id: CompanyValue.all.sample[:id]
end 

1.upto(2) do |i|
  Admin.create!(email: "admin#{i}@test.com", password: 'password')
end


1.upto(5) do |i|
  reward = Reward.create! title: "Reward #{i}",
    description: Faker::Superhero.power,
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2)
end