FactoryGirl.define do
  sequence(:tag_list) {|n| "common,test#{n},rspec#{n},ruby#{n},#rails#{n}" }
  sequence(:author_id)

  factory :user, :class => User do
    email { Faker::Internet.safe_email }
    password { Faker::Lorem.characters(10) }
  end

  factory :post, :class => Slate::Post do
    title { Faker::Lorem.sentence(3) }
    excerpt { Faker::Lorem.sentence(1) }
    body { Faker::Lorem.paragraph(5) }
    published true
    tag_list { generate(:tag_list) }
    author_id { generate(:author_id) }

    factory :post_with_comments do
      ignore do
        comments_count 15
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post: post)
      end
    end

    factory :post_draft do
      published false
    end

    association :blog, factory: :blog
  end

  factory :comment, :class => Slate::Comment do
    author_name { Faker::Name.name }
    author_email { Faker::Internet.safe_email }
    body { Faker::Lorem.paragraph(1) }
    association :post, factory: :post

    factory :spam_comment do
      spam true
    end
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

    factory :blog_with_posts_with_comments do
      ignore do
        posts_count 15
      end

      after(:create) do |blog, evaluator|
        create_list(:post_with_comments, evaluator.posts_count, blog: blog)
      end
    end
  end
end
