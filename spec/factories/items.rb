FactoryBot.define do
   factory :item do
     name {Faker::Name.last_name}
     description{Faker::Lorem.sentence}
     genre_id {Faker::Number.within(range: 2..9) }
     cost { Faker::Number.within(range: 300..99_999)} 
     image { Faker::Lorem.sentence }
     association :user
     
     after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
     end
   end
end


