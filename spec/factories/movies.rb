FactoryBot.define do
  factory :movie do
    title { Faker::Movie.quote }
    release_year { Faker::Number.between(from = 1900, to = 2060) }
  end
end
