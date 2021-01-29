FactoryBot.define do
  password = Faker::Internet.password(min_length: 6)
  factory :user do
      name { Faker::Name.last_name }
      email { Faker::Internet.free_email }
      password { password }
      password_confirmation { password }  
      phone_number {Faker::Number.within(range: 300..999_999)}  
  end
end
