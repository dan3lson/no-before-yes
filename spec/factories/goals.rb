FactoryBot.define do
  factory :goal do
    target { rand(50) }

    user
  end
end
