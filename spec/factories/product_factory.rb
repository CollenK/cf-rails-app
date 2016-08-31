FactoryGirl.define do

  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph }
    image_url { Faker::Internet.url }
    color { Faker::Commerce.color }
    price { Faker::Commerce.price }

    factory :invalid_product do
      name nil
    end
  end

end
