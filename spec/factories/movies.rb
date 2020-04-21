FactoryBot.define do
  factory :movie do
    title { Faker::Movie.quote }
    release_year { Faker::Date.between(from: Date - 120.years, to: Date.today) }
  end
end
