FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    published { Faker::Date.between(2.years.ago, Date.today) }
    content { Faker::Lorem.paragraph }
    hidden false
    pinned false
  end
end
