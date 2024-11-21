FactoryBot.define do
  factory :board do
    email { Faker::Internet.email }
    board_name { Faker::Lorem.word }
    width { Faker::Number.between(from: 5, to: 10) }
    height { Faker::Number.between(from: 5, to: 10) }
    mines { Faker::Number.between(from: 1, to: 10) }
  end
end
