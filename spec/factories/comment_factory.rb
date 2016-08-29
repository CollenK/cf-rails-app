FactoryGirl.define do

  factory :comment do
    rating { Faker::Number.between(1, 5) }
    user
    product
    body { Faker::Lorem.paragraph }

  end
end
