FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    free_trial_expires_at { Time.current + 30.days }
  end
end
