FactoryBot.define do
  factory :purchase do
    token { 'aaaaaaa' }
    total_cost{ Faker::Number.within(range: 0..999_999)} 
  
  end
end
