FactoryBot.define do
  factory :service do
    title { Faker::Lorem.words(number: 4) }
    description { Faker::Lorem.paragraph(sentence_count: 5) }
    image_url { Faker::Placeholdit.image }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
