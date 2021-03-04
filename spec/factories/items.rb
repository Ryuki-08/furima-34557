FactoryBot.define do
  factory :item do
    name { '名前' }
    name_description { '説明' }
    category_id { 2 }
    product_condition_id { 2 }
    shipping_charges_id { 2 }
    prefectures_id { 2 }
    days_to_ship_id { 2 }
    price { 5000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
