FactoryBot.define do
  factory :screenshot do
    article
    image { fixture_file_upload(Rails.root.join('test', 'files', 'test.png'), 'png') }
  end
end
