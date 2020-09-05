FactoryBot.define do
  factory :favourite do
    user_id { User.first.id || association(:user) }
    service_id { Service.first.id || association(:service) }
  end
end
