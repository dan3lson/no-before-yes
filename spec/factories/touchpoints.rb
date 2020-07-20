FactoryBot.define do
  factory :touchpoint do
    recap { Faker::Lorem.sentence }
    follow_up_on { Date.current + 2.weeks }

    user
    contact

    trait :yes do
      result { :yes }
    end

    trait :email do
      source { :email }
    end

    trait :in_person do
      source { :in_person }
    end
  end
end
