FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies must be pretty long."
    user
    topic { Topic.create(name: 'Topic name') }

    factory :post_with_comment do
      transient do
        comments_count {2}
      end

      after(:create) do |post, evaluator|
        create_list(:comment, evaluator.comments_count, post: post)
      end
    end
  end
end
