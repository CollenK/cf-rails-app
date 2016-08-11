FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@example.com"}

  factory :user do
    email
    password "password"
    first_name "Test"
    last_name "User"
    admin false
  end

  factory :user2, class: User do
    email
    password "password"
    first_name "Test2"
    last_name "User2"
    admin false
  end

  factory :admin, class: User do
    email
    password "password"
    first_name "Admin"
    last_name "User"
    admin true
  end

end
