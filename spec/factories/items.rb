FactoryBot.define do
  factory :item do
    name                  {Faker::Internet.name}
    content               {Faker::Lorem.sentence}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    condition_id             {2}
    category_id              {2}
    shipping_date_id         {2}
    shipping_fee_id          {2}
    shipping_place_id        {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
