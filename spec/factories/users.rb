FactoryBot.define do
  factory :user do
    nickname {"ryuki"}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password
    password {password}
    password_confirmation {password}
    family_name {"布施"}
    first_name {"龍気"}
    family_name_kana {"フセ"}
    first_name_kana {"リュウキ"}
    birthday {"1997-08-04"}
  end
end