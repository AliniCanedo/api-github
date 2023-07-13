FactoryBot.define do
  factory :repository do
    name { "John Doe" }
    owner { "John Doe" }
    language { "John Doe" }
    stars { 0 }
    forks { 0 }
    favorite { false }
  end
end
  