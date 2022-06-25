FactoryBot.define do
  factory :comment do
    article
    email { "mark@mark.com" }
    body { "The body..." }
  end
end