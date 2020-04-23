FactoryBot.define do
  factory :user do
    email { Faker::Internet.safe_email }
    password { 'ABCD1234' }
    password_confirmation { 'ABCD1234' }
  end
end
