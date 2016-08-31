FactoryGirl.define do

  factory :comment do
    rating { Faker::Number.between(1, 5) }
    user
    product
    body { Faker::Lorem.paragraph }

    factory :invalid_comment do
      body nil
    end

  end
end
