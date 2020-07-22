FactoryBot.define do
  factory :touchpoint do
    recap { Faker::Lorem.sentence }
    follow_up_on { Date.current + 2.weeks }

    user
    contact
  end
end
