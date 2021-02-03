FactoryBot.define do
  factory :cart do
    quantity {Faker::Number.within(range: 1..8)}
    association :table
  end
end
