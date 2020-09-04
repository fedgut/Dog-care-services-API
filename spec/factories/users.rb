FactoryBot.define do
  factory :user do
    admin { true }
    name { Faker::Games::HeroesOfTheStorm.hero }
    email { Faker::Internet.email }
    password { 'foobar' }
  end
end
