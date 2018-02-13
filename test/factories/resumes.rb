include ActionDispatch::TestProcess

FactoryBot.define do
  factory :resume do
    user
    pdf { fixture_file_upload(Rails.root.join('test', 'files', 'test.pdf'), 'application/pdf') }
  end
end
