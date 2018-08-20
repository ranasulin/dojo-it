FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_post_and_comment do
      transient do
        post_with_comments_count { 5 }
      end

      after(:create) do |user, evaluator|
        create_list(:post_with_comment, evaluator.post_with_comments_count, user: user)
      end
    end
  end


end
