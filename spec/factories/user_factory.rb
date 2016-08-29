FactoryGirl.define do

  factory :user do
    email { Faker::Internet.email }
    # password { Faker::Internet.password }
    password "secret"
    password_confirmation "secret"
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    admin false

    factory :invalid_user do
      first_name nil
    end

    factory :admin do
      admin true
    end
  end

end
