FactoryBot.define do
  factory :user do
    first_name { Faker::FunnyName }
    nickname { Faker::FunnyName }
    password { "123456" }
    email { "Elloypito@gmail.com" }
  end
end
