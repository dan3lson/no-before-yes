FactoryBot.define do
  factory :blog_post do
    title { Faker::Lorem.sentence }
    publish_on { Date.today }
    icon { 'book-reader' }
    bg_color { Faker::Color.color_name }

    publisher factory: :user
  end
end
