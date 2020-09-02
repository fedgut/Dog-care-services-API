FactoryBot.define do
  factory :user do
    admin { true }
    name { Faker::Games::HeroesOfTheStorm.hero }
  end
end
