FactoryBot.define do
  factory :buy_address do
    postal_code { '123-4567' }
    prefectures_id { 2 }
    municipality { '川越' }
    building_name { 'ビル' }
    house_number { '111-1' }
    phone_number { '080-1234-5678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
