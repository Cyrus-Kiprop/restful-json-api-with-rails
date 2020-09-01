FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Interet.email }
    password { 'foobar' }
  end
end
