FactoryGirl.define do
  sequence(:tag_list) {|n| "common,test#{n},rspec#{n},ruby#{n},#rails#{n}" }
  sequence(:author_id)

  factory :post, :class => Slate::Post do
    title { Faker::Lorem.sentence(3) }
    excerpt { Faker::Lorem.sentence(1) }
    body { Faker::Lorem.paragraph(5) }
    published true
    tag_list { generate(:tag_list) }
    author_id { generate(:author_id) }

    factory :post_draft do
      published false
    end

    association :blog, factory: :blog
  end

  factory :blog, :class => Slate::Blog do
    title { Faker::Lorem.sentence(2) }
    description { Faker::Lorem.paragraph(3) }
    author_id { generate(:author_id) }
    factory :blog_with_posts do
      ignore do
        posts_count 15
      end

      after(:create) do |blog, evaluator|
        create_list(:post, evaluator.posts_count, blog: blog)
      end
    end
  end
end
