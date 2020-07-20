FactoryBot.define do
  factory :contact do
    name { Faker::Name.unique.name }

    user

    trait :website do
      website { Faker::Internet.url}
    end

    trait :phone_number do
      phone_number { Faker::PhoneNumber.phone_number }
    end

    trait :note do
      note { Faker::Lorem.sentence }
    end
  end
end
