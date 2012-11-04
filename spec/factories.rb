FactoryGirl.define do
  sequence(:title) {|n| "Fun Title #{n}" }
  sequence(:body) {|n| "Some very long body #{n}" }
  sequence(:description) {|n| "Some very long description #{n}" }

  factory :post, :class => Slate::Post do
    title { FactoryGirl.generate(:title) }
    body { FactoryGirl.generate(:body) }
    published true
  end

  factory :blog, :class => Slate::Blog do
    title { FactoryGirl.generate(:title) }
    description { FactoryGirl.generate(:description) }
  end
end
