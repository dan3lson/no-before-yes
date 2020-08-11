FactoryBot.define do
  factory :goal do
    target { rand(100) }
    
    user
  end
end
