FactoryBot.define do
  factory :user do
    admin { false }
    name { Faker::Games::HeroesOfTheStorm.hero }
  end
end
