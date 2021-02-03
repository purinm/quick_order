FactoryBot.define do
  factory :order do
    reserved {Faker::Boolean.boolean}
    association :table
    association :purchase
  end
end
