FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    parameterized { title.parameterize }
    published { Faker::Date.between(2.years.ago, Date.today) }
    content { Faker::Lorem.paragraph }
    markdown { ApplicationController.helpers.markdown(content) }
    hidden false
  end
end
