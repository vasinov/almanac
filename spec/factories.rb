FactoryGirl.define do
  factory :post, :class => Slate::Post do
    title { Faker::Lorem.sentence(3) }
    body { Faker::Lorem.paragraph(5) }
    published true
  end

  factory :blog, :class => Slate::Blog do
    title { Faker::Lorem.sentence(2) }
    description { Faker::Lorem.paragraph(3) }
  end
end
