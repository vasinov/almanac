FactoryGirl.define do
  sequence(:title) {|n| "Fun Title #{n}" }
  sequence(:body) {|n| "Some very long body #{n}" }

  factory :post, :class => Slate::Post do
    title { FactoryGirl.generate(:title) }
    body { FactoryGirl.generate(:body) }
    published true

    factory :manager do
    end
  end
end
