FactoryBot.define do
  factory :movie do
    title { Faker::Movie.quote }
    release_year { Faker::Number.between(1900, 2060) }
  end
end
