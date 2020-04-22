class Participation < ApplicationRecord
  belongs_to :person
  belongs_to :movie

  enum role: %i[actor actress director producer]
end
