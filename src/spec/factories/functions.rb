FactoryBot.define do
  factory :function do
    usage { Faker::Lorem.paragraph }
    sequence :code do |n|
      "def foo#{n}; end"
    end
    association :user

    trait :invalid_name do
      name { nil }
    end
  end
end
